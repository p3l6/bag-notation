module.exports = grammar({
  name: 'BagNotation',

  extras: $ => [ /[ \t]+/ ],

  rules: {
    //// File structure
    file: $ => seq(optional(repeat($._blank_line)), repeat1($.tune)),
    tune: $ => seq($.header, optional($.body)),
    body: $ => repeat1(choice($._blank_line, $.line)),
    line: $ => seq(
                 optional($._inline_field),
                 optional($.barline),
                 repeat1($.measure),
                 optional($.tail_comment),
                 "\n"),

    //// Header and fields
    header: $ => seq("---\n", repeat(seq($.field, "\n")), "---\n"),
    _inline_field: $ => seq("(", $.field, ")"),
    field: $ => seq(
                    field("label", $.field_content),
                    optional(seq(":", field("value", $.field_content)))),
    field_content: $ => /[ a-zA-Z0-9\/,]+/,

    //// Measures
    measure: $ => seq(repeat($._measure_content), prec(-1, $.barline)),
    barline: $ => /[\[\]|:]+/, // TODO: optional trailing number or range(-,) or string. no space.
    _measure_content: $ => choice($.string, prec(-1, $._inline_field), $.note_cluster),

    //// Notes and clusters
    note_cluster: $ => seq(repeat1($.note), /[ \t]/),
    note: $ => seq(
                   field('embellishment', optional($._embellishment)),
                   field('pitch', $.pitch),
                   field('duration', optional($.duration))),
    _embellishment: $ => choice($.embellishment, $.literal_embellishment),
    embellishment: $ => /[phluxtvwzkn]+/,
    literal_embellishment: $ => seq("{", repeat1($.pitch), "}"),
    pitch: $ => /[qrbcdefga]/,
    duration: $ => /[+.\/-]+/,

    //// Other
    string: $ => seq("\"", /[^"]+/, "\""),
    _blank_line: $ => choice("\n", $.comment),
    comment: $ => seq("%", /[^\n]*/, "\n"),
    tail_comment: $ => seq("%", /[^\n]*/)
  }
});
