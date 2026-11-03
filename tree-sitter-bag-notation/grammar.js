module.exports = grammar({
  name: 'BagNotation',

  // no whitespace in extras - control specifically to enable cluster grouping
  extras: $ => [],

  rules: {
    //// File structure
    file: $ => seq(optional(repeat($._blank_line)), repeat1($.tune)),
    tune: $ => seq($.header, optional($._body)),
    _body: $ => repeat1(choice($._blank_line, $.voice)),
    voice: $ => prec(2, seq(
                 optional( $._whitespace),
                 optional(seq($.field, optional($._whitespace))),
                 optional(seq($.barline,  optional($._whitespace))),
                 repeat1($.bar),
                 optional($._open_bar),
                 optional($.comment),
                 "\n")),

    //// Header and fields
    header: $ => seq("---\n", repeat(seq($._header_field, "\n")), "---\n"),
    _header_field: $ => alias($._field_parts, $.field),
    field: $ => choice(seq("(", $._field_parts, ")"), prec(1, $.shorthand_label)),
    shorthand_label: $ => /[&^',=01234]/,
    _field_parts: $ => seq($.field_label, optional(seq(":", $.field_value))),
    field_label: $ => /[ a-zA-Z']+/,
    field_value: $ => /[^\)\n]+/,

    //// Bars
    bar: $ => seq(repeat($._bar_content), prec(-1, $.barline)),
    _open_bar: $ => alias(prec(-1, repeat1($._bar_content)), $.bar),
    barline: $ => /:?[|i]+:?/,
    _bar_content: $ => choice(prec(-1, $.field), $.cluster, $._whitespace),

    //// Notes and clusters
    cluster: $ =>seq(prec(-1, repeat1($.note))),
    note: $ => seq(
                 optional($.shorthand_label),
                 optional($.embellishment),
                 $.pitch,
                 optional($.duration),
                 optional($.connector)),
    embellishment: $ => /[qojkpzuymtsnxvr]+/,
    pitch: $ => /[labcdefgh]/,
    duration: $ => /[+.\/]+/,
    connector: $ => /[-_~]/,

    //// Other
    _whitespace: $ => /[ \t]+/,
    _blank_line: $ => seq(optional($.comment), "\n"),
    comment: $ => prec(1, seq(optional($._whitespace), "#", /[^\n]*/))
  }
});
