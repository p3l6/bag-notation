module.exports = grammar({
  name: 'BagNotation',

  extras: $ => [ /[ \t]+/ ],

  rules: {
    //// File structure
    file: $ => seq(optional(repeat($._blank_line)), repeat1($.tune)),
    tune: $ => seq($.header, optional($._body)),
    _body: $ => repeat1(choice($._blank_line, $.voice)),
    voice: $ => seq(
                 optional($._inline_field),
                 optional($.barline),
                 repeat1($.bar),
                 optional($.tail_comment),
                 "\n"),

    //// Header and fields
    header: $ => seq("---\n", repeat(seq($.field, "\n")), "---\n"),
    _inline_field: $ => seq("(", $.field, ")"),
    field: $ => seq($.field_label, optional(seq(":", $.field_value))),
    field_label: $ => /[ a-zA-Z0-9\/,']+/,
    field_value: $ => /[ a-zA-Z0-9\/,']+/,

    //// Bars
    bar: $ => seq(repeat($._bar_content), prec(-1, $.barline)),
    barline: $ => /:?\|+:?/,
    _bar_content: $ => choice(prec(-1, $._inline_field), $.cluster),

    //// Notes and clusters
    cluster: $ => seq(repeat1($.note), /[ \t]/), // TODO: `note|` doesnt parse right, maybe token.immediate would help here?
    note: $ => seq(
                 optional($.embellishment),
                 $.pitch,
                 optional($.duration),
                 optional($.connector)),
    embellishment: $ => /[qojkpzuymtsnxvr]+/,
    pitch: $ => /[labcdefgh]/,
    duration: $ => /[+.\/]+/,
    connector: $ => /[-_~]/,

    //// Other
    _blank_line: $ => choice("\n", $.comment),
    comment: $ => seq("%", /[^\n]*/, "\n"),
    tail_comment: $ => seq("%", /[^\n]*/)
  }
});
