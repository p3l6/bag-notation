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
    field: $ => seq($.label, $.value),
    inline_field: $ => seq("(", $.field, ")"),
    label: $ => seq(/[ a-zA-Z]+/, ":"),
    value: $ => /[ a-zA-Z0-9\/,]+/,

    //// Measures
    measure: $ => seq(repeat($._measure_element), $.barline),
    barline: $ => "|",
    _measure_element: $ => choice($.string, $.inline_field, $.note_cluster),

    //// Note groups
    note_cluster: $ => seq(repeat1($.note), /\s+/),
    note: $ => seq(optional($.embellisment), $.pitch, optional($.duration)),
    embellisment: $ => seq(optional(/[phlxu]/), /[xtvwzkn]{1-2}/),
    pitch: $ => /[qrbcdefga]/,
    duration: $ => /[0-9,.\/]+/,

    //// Other
    string: $ => seq("\"", /[^"]+/, "\""),
    comment: $ => seq("%", /[^\n]*/)
  }
});
