module.exports = grammar({
  name: 'bagfile',

  extras: $ => [ /[ \t]+/ ],

  rules: {
    //// File structure
    file: $ => seq(optional(repeat($._blank_line)), repeat1($.tune)),
    tune: $ => seq($.header, optional($.body)),
    body: $ => repeat1(choice($._blank_line, $.line)),
    line: $ => seq(
                 optional(seq(optional($.inline_field), $.barline)),
                 repeat1($.measure),
                 optional($.tail_comment),
                 "\n"),

    //// Header and fields
    header: $ => seq("---\n", repeat(seq($.field, "\n")), "---\n"),
    inline_field: $ => seq("(", $.field, ")"),
    field: $ => choice(
                  field("value", $.field_content),
                  seq(
                    field("label", $.field_content),
                    ":",
                    field("value", $.field_content))),
    field_content: $ => /[ a-zA-Z0-9\/,]+/,

    //// Measures
    measure: $ => seq(repeat($._measure_content), prec(-1, $.barline)),
    barline: $ => /[\[\]|:]+/, // TODO: optional trailing number or range(-,) or string. no space.
    _measure_content: $ => choice($.string, prec(-1, $.inline_field), $.note_cluster),

    //// Notes and clusters
    note_cluster: $ => seq(repeat1($.note), /[ \t]/),
    note: $ => seq(optional($._embellishment), $.pitch, optional($.duration)),
    _embellishment: $ => choice($.embellishment, $.literal_embellishment),
    embellishment: $ => /[phluxtvwzkn]+/,
    literal_embellishment: $ => seq("{", repeat1($.pitch), "}"),
    pitch: $ => /[qrbcdefga]/,
    duration: $ => /[0-9,.\/-]+/,

    //// Other
    string: $ => seq("\"", /[^"]+/, "\""),
    _blank_line: $ => choice("\n", $.comment),
    comment: $ => seq("%", /[^\n]*/, "\n"),
    tail_comment: $ => seq("%", /[^\n]*/)
  }
});
