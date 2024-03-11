module.exports = grammar({
  name: 'BagNotation',

  extras: $ => [ /[ \t]+/ ],

  rules: {
    //// File structure
    file: $ => seq(optional(repeat($._blank_line)), repeat1($.tune)),
    tune: $ => seq($.header, optional($._body)),
    _body: $ => repeat1(choice($._blank_line, $.line)),
    line: $ => seq(
                 optional($._inline_field),
                 optional($.barline),
                 repeat1($.measure),
                 optional($.tail_comment),
                 "\n"),

    //// Header and fields
    header: $ => seq("---\n", repeat(seq($.field, "\n")), "---\n"),
    _inline_field: $ => seq("(", $.field, ")"),
    field: $ => seq($.field_label, optional(seq(":", $.field_value))),
    field_label: $ => /[ a-zA-Z0-9\/,']+/,
    field_value: $ => /[ a-zA-Z0-9\/,']+/,

    //// Measures
    measure: $ => seq(repeat($._measure_content), prec(-1, $.barline)),
    barline: $ => /:?\|+:?/,
    _measure_content: $ => choice(prec(-1, $._inline_field), $.note_cluster),

    //// Notes and clusters
    note_cluster: $ => seq(repeat1($.note), /[ \t]/),
    note: $ => seq(
                 optional($.embellishment),
                 $.pitch,
                 optional($.duration),
                 optional($.tie)),
    embellishment: $ => /[phluxtvwzkn]+/,  // /[qojkpzuymsnxtvr]+/
    pitch: $ => /[qrbcdefga]/, // /[labcdefgh]/
    duration: $ => /[+.\/]+/,
    tie: $ => /[-_~]/,

    //// Other
    _blank_line: $ => choice("\n", $.comment),
    comment: $ => seq("%", /[^\n]*/, "\n"),
    tail_comment: $ => seq("%", /[^\n]*/)
  }
});
