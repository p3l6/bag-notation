module.exports = grammar({
  name: 'BagNotation',

  extras: $ => [ /[ \t]+/ ],

  rules: {
    //// File structure
    file: $ => seq(optional(repeat($._blank_line)), repeat1($.tune)),
    tune: $ => seq($.header, optional($._body)),
    _body: $ => repeat1(choice($._blank_line, $.voice)),
    voice: $ => seq(
                 optional($.field),
                 optional($.barline),
                 repeat1($.bar),
                 optional($.tail_comment),
                 "\n"),

    //// Header and fields
    header: $ => seq("---\n", repeat(seq($._header_field, "\n")), "---\n"),
    _header_field: $ => alias($._field_parts, $.field),
    field: $ => choice(seq("(", $._field_parts, ")"), $.shorthand_label),
    shorthand_label: $ => /[&]/,
    _field_parts: $ => seq($.field_label, optional(seq(":", $.field_value))),
    field_label: $ => /[ a-zA-Z']+/,
    field_value: $ => /[ a-zA-Z0-9\/,.'-]+/,

    //// Bars
    bar: $ => seq(repeat($._bar_content), prec(-1, $.barline)),
    barline: $ => /:?\|+:?/,
    _bar_content: $ => choice(prec(-1, $.field), $.cluster),

    //// Notes and clusters
    cluster: $ => seq(repeat1($.note), /[ \t]/), // TODO: `note|` doesn't parse as valid. try to remove this hard whitespace for that case.
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
    comment: $ => seq("#", /[^\n]*/, "\n"),
    tail_comment: $ => seq("#", /[^\n]*/)
  }
});
