module.exports = grammar({
  name: 'bagfile',

  extras: $ => [ $.comment, /\s+/ ],

  rules: {
    //// File structure
    file: $ => repeat1($.tune),
    tune: $ => seq($.header, optional($.body)),
    body: $ => repeat1($.measure),

    //// Header and fields
    header: $ => seq("---\n", repeat(seq($.field, "\n")), "---\n"),
    inline_field: $ => seq("(", $.field, ")"),
    field: $ => choice(
                       field("value", $.field_element),
                       seq(field("label", $.field_element), ":", field("value", $.field_element))),
    field_element: $ =>  /[ a-zA-Z0-9\/,]+/, // Consider renaming this

    //// Measures
    measure: $ => seq(repeat($._measure_element), $.barline),
    barline: $ => "|",
    _measure_element: $ => choice($.string, $.inline_field, $.note_cluster),

    //// Note groups
    note_cluster: $ => seq(repeat1($.note), /\s+/),
    note: $ => seq(optional($.embellishment), $.pitch, optional($.duration)),
    embellishment: $ => /[phluxtvwzkn]+/,
    pitch: $ => /[qrbcdefga]/,
    duration: $ => /[0-9,.\/]+/,

    //// Other
    string: $ => seq("\"", /[^"]+/, "\""),
    comment: $ => seq("%", /[^\n]*/)
  }
});
