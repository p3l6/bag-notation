#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 14
#define STATE_COUNT 63
#define LARGE_STATE_COUNT 5
#define SYMBOL_COUNT 43
#define ALIAS_COUNT 0
#define TOKEN_COUNT 18
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 2
#define MAX_ALIAS_SEQUENCE_LENGTH 5
#define PRODUCTION_ID_COUNT 3

enum {
  anon_sym_LF = 1,
  anon_sym_DASH_DASH_DASH_LF = 2,
  anon_sym_LPAREN = 3,
  anon_sym_RPAREN = 4,
  anon_sym_COLON = 5,
  sym_field_content = 6,
  sym_barline = 7,
  aux_sym_note_cluster_token1 = 8,
  sym_embellishment = 9,
  anon_sym_LBRACE = 10,
  anon_sym_RBRACE = 11,
  sym_pitch = 12,
  sym_duration = 13,
  anon_sym_DQUOTE = 14,
  aux_sym_string_token1 = 15,
  anon_sym_PERCENT = 16,
  aux_sym_comment_token1 = 17,
  sym_file = 18,
  sym_tune = 19,
  sym_body = 20,
  sym_line = 21,
  sym_header = 22,
  sym_inline_field = 23,
  sym_field = 24,
  sym_measure = 25,
  sym__measure_content = 26,
  sym_note_cluster = 27,
  sym_note = 28,
  sym__embellishment = 29,
  sym_literal_embellishment = 30,
  sym_string = 31,
  sym__blank_line = 32,
  sym_comment = 33,
  sym_tail_comment = 34,
  aux_sym_file_repeat1 = 35,
  aux_sym_file_repeat2 = 36,
  aux_sym_body_repeat1 = 37,
  aux_sym_line_repeat1 = 38,
  aux_sym_header_repeat1 = 39,
  aux_sym_measure_repeat1 = 40,
  aux_sym_note_cluster_repeat1 = 41,
  aux_sym_literal_embellishment_repeat1 = 42,
};

static const char * const ts_symbol_names[] = {
  [ts_builtin_sym_end] = "end",
  [anon_sym_LF] = "\n",
  [anon_sym_DASH_DASH_DASH_LF] = "---\n",
  [anon_sym_LPAREN] = "(",
  [anon_sym_RPAREN] = ")",
  [anon_sym_COLON] = ":",
  [sym_field_content] = "field_content",
  [sym_barline] = "barline",
  [aux_sym_note_cluster_token1] = "note_cluster_token1",
  [sym_embellishment] = "embellishment",
  [anon_sym_LBRACE] = "{",
  [anon_sym_RBRACE] = "}",
  [sym_pitch] = "pitch",
  [sym_duration] = "duration",
  [anon_sym_DQUOTE] = "\"",
  [aux_sym_string_token1] = "string_token1",
  [anon_sym_PERCENT] = "%",
  [aux_sym_comment_token1] = "comment_token1",
  [sym_file] = "file",
  [sym_tune] = "tune",
  [sym_body] = "body",
  [sym_line] = "line",
  [sym_header] = "header",
  [sym_inline_field] = "inline_field",
  [sym_field] = "field",
  [sym_measure] = "measure",
  [sym__measure_content] = "_measure_content",
  [sym_note_cluster] = "note_cluster",
  [sym_note] = "note",
  [sym__embellishment] = "_embellishment",
  [sym_literal_embellishment] = "literal_embellishment",
  [sym_string] = "string",
  [sym__blank_line] = "_blank_line",
  [sym_comment] = "comment",
  [sym_tail_comment] = "tail_comment",
  [aux_sym_file_repeat1] = "file_repeat1",
  [aux_sym_file_repeat2] = "file_repeat2",
  [aux_sym_body_repeat1] = "body_repeat1",
  [aux_sym_line_repeat1] = "line_repeat1",
  [aux_sym_header_repeat1] = "header_repeat1",
  [aux_sym_measure_repeat1] = "measure_repeat1",
  [aux_sym_note_cluster_repeat1] = "note_cluster_repeat1",
  [aux_sym_literal_embellishment_repeat1] = "literal_embellishment_repeat1",
};

static const TSSymbol ts_symbol_map[] = {
  [ts_builtin_sym_end] = ts_builtin_sym_end,
  [anon_sym_LF] = anon_sym_LF,
  [anon_sym_DASH_DASH_DASH_LF] = anon_sym_DASH_DASH_DASH_LF,
  [anon_sym_LPAREN] = anon_sym_LPAREN,
  [anon_sym_RPAREN] = anon_sym_RPAREN,
  [anon_sym_COLON] = anon_sym_COLON,
  [sym_field_content] = sym_field_content,
  [sym_barline] = sym_barline,
  [aux_sym_note_cluster_token1] = aux_sym_note_cluster_token1,
  [sym_embellishment] = sym_embellishment,
  [anon_sym_LBRACE] = anon_sym_LBRACE,
  [anon_sym_RBRACE] = anon_sym_RBRACE,
  [sym_pitch] = sym_pitch,
  [sym_duration] = sym_duration,
  [anon_sym_DQUOTE] = anon_sym_DQUOTE,
  [aux_sym_string_token1] = aux_sym_string_token1,
  [anon_sym_PERCENT] = anon_sym_PERCENT,
  [aux_sym_comment_token1] = aux_sym_comment_token1,
  [sym_file] = sym_file,
  [sym_tune] = sym_tune,
  [sym_body] = sym_body,
  [sym_line] = sym_line,
  [sym_header] = sym_header,
  [sym_inline_field] = sym_inline_field,
  [sym_field] = sym_field,
  [sym_measure] = sym_measure,
  [sym__measure_content] = sym__measure_content,
  [sym_note_cluster] = sym_note_cluster,
  [sym_note] = sym_note,
  [sym__embellishment] = sym__embellishment,
  [sym_literal_embellishment] = sym_literal_embellishment,
  [sym_string] = sym_string,
  [sym__blank_line] = sym__blank_line,
  [sym_comment] = sym_comment,
  [sym_tail_comment] = sym_tail_comment,
  [aux_sym_file_repeat1] = aux_sym_file_repeat1,
  [aux_sym_file_repeat2] = aux_sym_file_repeat2,
  [aux_sym_body_repeat1] = aux_sym_body_repeat1,
  [aux_sym_line_repeat1] = aux_sym_line_repeat1,
  [aux_sym_header_repeat1] = aux_sym_header_repeat1,
  [aux_sym_measure_repeat1] = aux_sym_measure_repeat1,
  [aux_sym_note_cluster_repeat1] = aux_sym_note_cluster_repeat1,
  [aux_sym_literal_embellishment_repeat1] = aux_sym_literal_embellishment_repeat1,
};

static const TSSymbolMetadata ts_symbol_metadata[] = {
  [ts_builtin_sym_end] = {
    .visible = false,
    .named = true,
  },
  [anon_sym_LF] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_DASH_DASH_DASH_LF] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_LPAREN] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_RPAREN] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_COLON] = {
    .visible = true,
    .named = false,
  },
  [sym_field_content] = {
    .visible = true,
    .named = true,
  },
  [sym_barline] = {
    .visible = true,
    .named = true,
  },
  [aux_sym_note_cluster_token1] = {
    .visible = false,
    .named = false,
  },
  [sym_embellishment] = {
    .visible = true,
    .named = true,
  },
  [anon_sym_LBRACE] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_RBRACE] = {
    .visible = true,
    .named = false,
  },
  [sym_pitch] = {
    .visible = true,
    .named = true,
  },
  [sym_duration] = {
    .visible = true,
    .named = true,
  },
  [anon_sym_DQUOTE] = {
    .visible = true,
    .named = false,
  },
  [aux_sym_string_token1] = {
    .visible = false,
    .named = false,
  },
  [anon_sym_PERCENT] = {
    .visible = true,
    .named = false,
  },
  [aux_sym_comment_token1] = {
    .visible = false,
    .named = false,
  },
  [sym_file] = {
    .visible = true,
    .named = true,
  },
  [sym_tune] = {
    .visible = true,
    .named = true,
  },
  [sym_body] = {
    .visible = true,
    .named = true,
  },
  [sym_line] = {
    .visible = true,
    .named = true,
  },
  [sym_header] = {
    .visible = true,
    .named = true,
  },
  [sym_inline_field] = {
    .visible = true,
    .named = true,
  },
  [sym_field] = {
    .visible = true,
    .named = true,
  },
  [sym_measure] = {
    .visible = true,
    .named = true,
  },
  [sym__measure_content] = {
    .visible = false,
    .named = true,
  },
  [sym_note_cluster] = {
    .visible = true,
    .named = true,
  },
  [sym_note] = {
    .visible = true,
    .named = true,
  },
  [sym__embellishment] = {
    .visible = false,
    .named = true,
  },
  [sym_literal_embellishment] = {
    .visible = true,
    .named = true,
  },
  [sym_string] = {
    .visible = true,
    .named = true,
  },
  [sym__blank_line] = {
    .visible = false,
    .named = true,
  },
  [sym_comment] = {
    .visible = true,
    .named = true,
  },
  [sym_tail_comment] = {
    .visible = true,
    .named = true,
  },
  [aux_sym_file_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_file_repeat2] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_body_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_line_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_header_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_measure_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_note_cluster_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_literal_embellishment_repeat1] = {
    .visible = false,
    .named = false,
  },
};

enum {
  field_label = 1,
  field_value = 2,
};

static const char * const ts_field_names[] = {
  [0] = NULL,
  [field_label] = "label",
  [field_value] = "value",
};

static const TSFieldMapSlice ts_field_map_slices[PRODUCTION_ID_COUNT] = {
  [1] = {.index = 0, .length = 1},
  [2] = {.index = 1, .length = 2},
};

static const TSFieldMapEntry ts_field_map_entries[] = {
  [0] =
    {field_value, 0},
  [1] =
    {field_label, 0},
    {field_value, 2},
};

static const TSSymbol ts_alias_sequences[PRODUCTION_ID_COUNT][MAX_ALIAS_SEQUENCE_LENGTH] = {
  [0] = {0},
};

static const uint16_t ts_non_terminal_alias_map[] = {
  0,
};

static const TSStateId ts_primary_state_ids[STATE_COUNT] = {
  [0] = 0,
  [1] = 1,
  [2] = 2,
  [3] = 3,
  [4] = 4,
  [5] = 5,
  [6] = 6,
  [7] = 7,
  [8] = 8,
  [9] = 9,
  [10] = 10,
  [11] = 11,
  [12] = 12,
  [13] = 13,
  [14] = 14,
  [15] = 15,
  [16] = 16,
  [17] = 17,
  [18] = 18,
  [19] = 19,
  [20] = 20,
  [21] = 21,
  [22] = 22,
  [23] = 23,
  [24] = 24,
  [25] = 25,
  [26] = 26,
  [27] = 27,
  [28] = 28,
  [29] = 29,
  [30] = 30,
  [31] = 31,
  [32] = 32,
  [33] = 33,
  [34] = 34,
  [35] = 35,
  [36] = 36,
  [37] = 37,
  [38] = 38,
  [39] = 39,
  [40] = 40,
  [41] = 41,
  [42] = 42,
  [43] = 43,
  [44] = 44,
  [45] = 45,
  [46] = 46,
  [47] = 47,
  [48] = 48,
  [49] = 49,
  [50] = 50,
  [51] = 51,
  [52] = 52,
  [53] = 53,
  [54] = 54,
  [55] = 55,
  [56] = 56,
  [57] = 57,
  [58] = 58,
  [59] = 59,
  [60] = 60,
  [61] = 61,
  [62] = 62,
};

static bool ts_lex(TSLexer *lexer, TSStateId state) {
  START_LEXER();
  eof = lexer->eof(lexer);
  switch (state) {
    case 0:
      if (eof) ADVANCE(9);
      if (lookahead == '\n') ADVANCE(10);
      if (lookahead == '"') ADVANCE(28);
      if (lookahead == '%') ADVANCE(31);
      if (lookahead == '(') ADVANCE(12);
      if (lookahead == ')') ADVANCE(13);
      if (lookahead == '-') ADVANCE(26);
      if (lookahead == ':') ADVANCE(15);
      if (lookahead == '{') ADVANCE(21);
      if (lookahead == '}') ADVANCE(22);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(0)
      if (lookahead == '[' ||
          lookahead == ']' ||
          lookahead == '|') ADVANCE(18);
      if (('a' <= lookahead && lookahead <= 'g') ||
          lookahead == 'q' ||
          lookahead == 'r') ADVANCE(23);
      if (lookahead == 'h' ||
          lookahead == 'k' ||
          lookahead == 'l' ||
          lookahead == 'n' ||
          lookahead == 'p' ||
          ('t' <= lookahead && lookahead <= 'x') ||
          lookahead == 'z') ADVANCE(20);
      if ((',' <= lookahead && lookahead <= '9')) ADVANCE(27);
      END_STATE();
    case 1:
      if (lookahead == '\t') SKIP(1)
      if (lookahead == ' ') ADVANCE(16);
      if (lookahead == '-') ADVANCE(5);
      if (lookahead == ',' ||
          ('/' <= lookahead && lookahead <= '9') ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(17);
      END_STATE();
    case 2:
      if (lookahead == '\n') ADVANCE(10);
      if (lookahead == ')') ADVANCE(13);
      if (lookahead == ':') ADVANCE(14);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(2)
      END_STATE();
    case 3:
      if (lookahead == '\n') ADVANCE(11);
      END_STATE();
    case 4:
      if (lookahead == '-') ADVANCE(3);
      END_STATE();
    case 5:
      if (lookahead == '-') ADVANCE(4);
      END_STATE();
    case 6:
      if (lookahead == '{') ADVANCE(21);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(19);
      if (('a' <= lookahead && lookahead <= 'g') ||
          lookahead == 'q' ||
          lookahead == 'r') ADVANCE(23);
      if (lookahead == 'h' ||
          lookahead == 'k' ||
          lookahead == 'l' ||
          lookahead == 'n' ||
          lookahead == 'p' ||
          ('t' <= lookahead && lookahead <= 'x') ||
          lookahead == 'z') ADVANCE(20);
      if ((',' <= lookahead && lookahead <= '9')) ADVANCE(27);
      END_STATE();
    case 7:
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(29);
      if (lookahead != 0 &&
          lookahead != '"') ADVANCE(30);
      END_STATE();
    case 8:
      if (eof) ADVANCE(9);
      if (lookahead == '\n') ADVANCE(10);
      if (lookahead == '"') ADVANCE(28);
      if (lookahead == '%') ADVANCE(31);
      if (lookahead == '(') ADVANCE(12);
      if (lookahead == '-') ADVANCE(5);
      if (lookahead == '{') ADVANCE(21);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(8)
      if (lookahead == ':' ||
          lookahead == '[' ||
          lookahead == ']' ||
          lookahead == '|') ADVANCE(18);
      if (('a' <= lookahead && lookahead <= 'g') ||
          lookahead == 'q' ||
          lookahead == 'r') ADVANCE(23);
      if (lookahead == 'h' ||
          lookahead == 'k' ||
          lookahead == 'l' ||
          lookahead == 'n' ||
          lookahead == 'p' ||
          ('t' <= lookahead && lookahead <= 'x') ||
          lookahead == 'z') ADVANCE(20);
      END_STATE();
    case 9:
      ACCEPT_TOKEN(ts_builtin_sym_end);
      END_STATE();
    case 10:
      ACCEPT_TOKEN(anon_sym_LF);
      END_STATE();
    case 11:
      ACCEPT_TOKEN(anon_sym_DASH_DASH_DASH_LF);
      END_STATE();
    case 12:
      ACCEPT_TOKEN(anon_sym_LPAREN);
      END_STATE();
    case 13:
      ACCEPT_TOKEN(anon_sym_RPAREN);
      END_STATE();
    case 14:
      ACCEPT_TOKEN(anon_sym_COLON);
      END_STATE();
    case 15:
      ACCEPT_TOKEN(anon_sym_COLON);
      if (lookahead == ':' ||
          lookahead == '[' ||
          lookahead == ']' ||
          lookahead == '|') ADVANCE(18);
      END_STATE();
    case 16:
      ACCEPT_TOKEN(sym_field_content);
      if (lookahead == ' ') ADVANCE(16);
      if (lookahead == ',' ||
          ('/' <= lookahead && lookahead <= '9') ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(17);
      END_STATE();
    case 17:
      ACCEPT_TOKEN(sym_field_content);
      if (lookahead == ' ' ||
          lookahead == ',' ||
          ('/' <= lookahead && lookahead <= '9') ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(17);
      END_STATE();
    case 18:
      ACCEPT_TOKEN(sym_barline);
      if (lookahead == ':' ||
          lookahead == '[' ||
          lookahead == ']' ||
          lookahead == '|') ADVANCE(18);
      END_STATE();
    case 19:
      ACCEPT_TOKEN(aux_sym_note_cluster_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(19);
      END_STATE();
    case 20:
      ACCEPT_TOKEN(sym_embellishment);
      if (lookahead == 'h' ||
          lookahead == 'k' ||
          lookahead == 'l' ||
          lookahead == 'n' ||
          lookahead == 'p' ||
          ('t' <= lookahead && lookahead <= 'x') ||
          lookahead == 'z') ADVANCE(20);
      END_STATE();
    case 21:
      ACCEPT_TOKEN(anon_sym_LBRACE);
      END_STATE();
    case 22:
      ACCEPT_TOKEN(anon_sym_RBRACE);
      END_STATE();
    case 23:
      ACCEPT_TOKEN(sym_pitch);
      END_STATE();
    case 24:
      ACCEPT_TOKEN(sym_duration);
      if (lookahead == '\n') ADVANCE(11);
      if ((',' <= lookahead && lookahead <= '9')) ADVANCE(27);
      END_STATE();
    case 25:
      ACCEPT_TOKEN(sym_duration);
      if (lookahead == '-') ADVANCE(24);
      if ((',' <= lookahead && lookahead <= '9')) ADVANCE(27);
      END_STATE();
    case 26:
      ACCEPT_TOKEN(sym_duration);
      if (lookahead == '-') ADVANCE(25);
      if ((',' <= lookahead && lookahead <= '9')) ADVANCE(27);
      END_STATE();
    case 27:
      ACCEPT_TOKEN(sym_duration);
      if ((',' <= lookahead && lookahead <= '9')) ADVANCE(27);
      END_STATE();
    case 28:
      ACCEPT_TOKEN(anon_sym_DQUOTE);
      END_STATE();
    case 29:
      ACCEPT_TOKEN(aux_sym_string_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(29);
      if (lookahead != 0 &&
          lookahead != '"') ADVANCE(30);
      END_STATE();
    case 30:
      ACCEPT_TOKEN(aux_sym_string_token1);
      if (lookahead != 0 &&
          lookahead != '"') ADVANCE(30);
      END_STATE();
    case 31:
      ACCEPT_TOKEN(anon_sym_PERCENT);
      END_STATE();
    case 32:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(32);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(33);
      END_STATE();
    case 33:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(33);
      END_STATE();
    default:
      return false;
  }
}

static const TSLexMode ts_lex_modes[STATE_COUNT] = {
  [0] = {.lex_state = 0},
  [1] = {.lex_state = 8},
  [2] = {.lex_state = 8},
  [3] = {.lex_state = 8},
  [4] = {.lex_state = 8},
  [5] = {.lex_state = 8},
  [6] = {.lex_state = 8},
  [7] = {.lex_state = 8},
  [8] = {.lex_state = 8},
  [9] = {.lex_state = 8},
  [10] = {.lex_state = 8},
  [11] = {.lex_state = 8},
  [12] = {.lex_state = 8},
  [13] = {.lex_state = 8},
  [14] = {.lex_state = 8},
  [15] = {.lex_state = 8},
  [16] = {.lex_state = 8},
  [17] = {.lex_state = 8},
  [18] = {.lex_state = 8},
  [19] = {.lex_state = 8},
  [20] = {.lex_state = 8},
  [21] = {.lex_state = 6},
  [22] = {.lex_state = 8},
  [23] = {.lex_state = 8},
  [24] = {.lex_state = 6},
  [25] = {.lex_state = 8},
  [26] = {.lex_state = 8},
  [27] = {.lex_state = 8},
  [28] = {.lex_state = 8},
  [29] = {.lex_state = 8},
  [30] = {.lex_state = 6},
  [31] = {.lex_state = 6},
  [32] = {.lex_state = 8},
  [33] = {.lex_state = 8},
  [34] = {.lex_state = 8},
  [35] = {.lex_state = 1},
  [36] = {.lex_state = 6},
  [37] = {.lex_state = 1},
  [38] = {.lex_state = 1},
  [39] = {.lex_state = 6},
  [40] = {.lex_state = 0},
  [41] = {.lex_state = 2},
  [42] = {.lex_state = 0},
  [43] = {.lex_state = 1},
  [44] = {.lex_state = 1},
  [45] = {.lex_state = 8},
  [46] = {.lex_state = 0},
  [47] = {.lex_state = 0},
  [48] = {.lex_state = 7},
  [49] = {.lex_state = 0},
  [50] = {.lex_state = 0},
  [51] = {.lex_state = 0},
  [52] = {.lex_state = 0},
  [53] = {.lex_state = 0},
  [54] = {.lex_state = 0},
  [55] = {.lex_state = 0},
  [56] = {.lex_state = 0},
  [57] = {.lex_state = 1},
  [58] = {.lex_state = 32},
  [59] = {.lex_state = 0},
  [60] = {.lex_state = 0},
  [61] = {.lex_state = 0},
  [62] = {.lex_state = 32},
};

static const uint16_t ts_parse_table[LARGE_STATE_COUNT][SYMBOL_COUNT] = {
  [0] = {
    [ts_builtin_sym_end] = ACTIONS(1),
    [anon_sym_LF] = ACTIONS(1),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(1),
    [anon_sym_LPAREN] = ACTIONS(1),
    [anon_sym_RPAREN] = ACTIONS(1),
    [anon_sym_COLON] = ACTIONS(1),
    [sym_barline] = ACTIONS(1),
    [sym_embellishment] = ACTIONS(1),
    [anon_sym_LBRACE] = ACTIONS(1),
    [anon_sym_RBRACE] = ACTIONS(1),
    [sym_pitch] = ACTIONS(1),
    [sym_duration] = ACTIONS(1),
    [anon_sym_DQUOTE] = ACTIONS(1),
    [anon_sym_PERCENT] = ACTIONS(1),
  },
  [1] = {
    [sym_file] = STATE(60),
    [sym_tune] = STATE(32),
    [sym_header] = STATE(2),
    [sym__blank_line] = STATE(20),
    [sym_comment] = STATE(20),
    [aux_sym_file_repeat1] = STATE(20),
    [aux_sym_file_repeat2] = STATE(32),
    [anon_sym_LF] = ACTIONS(3),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(5),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [2] = {
    [sym_body] = STATE(45),
    [sym_line] = STATE(3),
    [sym_inline_field] = STATE(27),
    [sym_measure] = STATE(6),
    [sym__measure_content] = STATE(12),
    [sym_note_cluster] = STATE(12),
    [sym_note] = STATE(21),
    [sym__embellishment] = STATE(50),
    [sym_literal_embellishment] = STATE(50),
    [sym_string] = STATE(12),
    [sym__blank_line] = STATE(3),
    [sym_comment] = STATE(3),
    [aux_sym_body_repeat1] = STATE(3),
    [aux_sym_line_repeat1] = STATE(6),
    [aux_sym_measure_repeat1] = STATE(12),
    [aux_sym_note_cluster_repeat1] = STATE(21),
    [ts_builtin_sym_end] = ACTIONS(9),
    [anon_sym_LF] = ACTIONS(11),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(9),
    [anon_sym_LPAREN] = ACTIONS(13),
    [sym_barline] = ACTIONS(15),
    [sym_embellishment] = ACTIONS(17),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_pitch] = ACTIONS(21),
    [anon_sym_DQUOTE] = ACTIONS(23),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [3] = {
    [sym_line] = STATE(4),
    [sym_inline_field] = STATE(27),
    [sym_measure] = STATE(6),
    [sym__measure_content] = STATE(12),
    [sym_note_cluster] = STATE(12),
    [sym_note] = STATE(21),
    [sym__embellishment] = STATE(50),
    [sym_literal_embellishment] = STATE(50),
    [sym_string] = STATE(12),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_body_repeat1] = STATE(4),
    [aux_sym_line_repeat1] = STATE(6),
    [aux_sym_measure_repeat1] = STATE(12),
    [aux_sym_note_cluster_repeat1] = STATE(21),
    [ts_builtin_sym_end] = ACTIONS(25),
    [anon_sym_LF] = ACTIONS(27),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(13),
    [sym_barline] = ACTIONS(15),
    [sym_embellishment] = ACTIONS(17),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_pitch] = ACTIONS(21),
    [anon_sym_DQUOTE] = ACTIONS(23),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [4] = {
    [sym_line] = STATE(4),
    [sym_inline_field] = STATE(27),
    [sym_measure] = STATE(6),
    [sym__measure_content] = STATE(12),
    [sym_note_cluster] = STATE(12),
    [sym_note] = STATE(21),
    [sym__embellishment] = STATE(50),
    [sym_literal_embellishment] = STATE(50),
    [sym_string] = STATE(12),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_body_repeat1] = STATE(4),
    [aux_sym_line_repeat1] = STATE(6),
    [aux_sym_measure_repeat1] = STATE(12),
    [aux_sym_note_cluster_repeat1] = STATE(21),
    [ts_builtin_sym_end] = ACTIONS(29),
    [anon_sym_LF] = ACTIONS(31),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(29),
    [anon_sym_LPAREN] = ACTIONS(34),
    [sym_barline] = ACTIONS(37),
    [sym_embellishment] = ACTIONS(40),
    [anon_sym_LBRACE] = ACTIONS(43),
    [sym_pitch] = ACTIONS(46),
    [anon_sym_DQUOTE] = ACTIONS(49),
    [anon_sym_PERCENT] = ACTIONS(52),
  },
};

static const uint16_t ts_small_parse_table[] = {
  [0] = 13,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(23), 1,
      anon_sym_DQUOTE,
    ACTIONS(55), 1,
      anon_sym_LF,
    ACTIONS(57), 1,
      sym_barline,
    ACTIONS(59), 1,
      anon_sym_PERCENT,
    STATE(53), 1,
      sym_tail_comment,
    STATE(9), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(21), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(50), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(12), 5,
      sym_inline_field,
      sym__measure_content,
      sym_note_cluster,
      sym_string,
      aux_sym_measure_repeat1,
  [47] = 13,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(23), 1,
      anon_sym_DQUOTE,
    ACTIONS(57), 1,
      sym_barline,
    ACTIONS(59), 1,
      anon_sym_PERCENT,
    ACTIONS(61), 1,
      anon_sym_LF,
    STATE(56), 1,
      sym_tail_comment,
    STATE(9), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(21), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(50), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(12), 5,
      sym_inline_field,
      sym__measure_content,
      sym_note_cluster,
      sym_string,
      aux_sym_measure_repeat1,
  [94] = 13,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(23), 1,
      anon_sym_DQUOTE,
    ACTIONS(57), 1,
      sym_barline,
    ACTIONS(59), 1,
      anon_sym_PERCENT,
    ACTIONS(63), 1,
      anon_sym_LF,
    STATE(61), 1,
      sym_tail_comment,
    STATE(9), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(21), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(50), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(12), 5,
      sym_inline_field,
      sym__measure_content,
      sym_note_cluster,
      sym_string,
      aux_sym_measure_repeat1,
  [141] = 11,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(23), 1,
      anon_sym_DQUOTE,
    ACTIONS(57), 1,
      sym_barline,
    ACTIONS(65), 2,
      anon_sym_LF,
      anon_sym_PERCENT,
    STATE(5), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(21), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(50), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(12), 5,
      sym_inline_field,
      sym__measure_content,
      sym_note_cluster,
      sym_string,
      aux_sym_measure_repeat1,
  [183] = 11,
    ACTIONS(69), 1,
      anon_sym_LPAREN,
    ACTIONS(72), 1,
      sym_barline,
    ACTIONS(75), 1,
      sym_embellishment,
    ACTIONS(78), 1,
      anon_sym_LBRACE,
    ACTIONS(81), 1,
      sym_pitch,
    ACTIONS(84), 1,
      anon_sym_DQUOTE,
    ACTIONS(67), 2,
      anon_sym_LF,
      anon_sym_PERCENT,
    STATE(9), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(21), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(50), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(12), 5,
      sym_inline_field,
      sym__measure_content,
      sym_note_cluster,
      sym_string,
      aux_sym_measure_repeat1,
  [225] = 10,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(23), 1,
      anon_sym_DQUOTE,
    ACTIONS(57), 1,
      sym_barline,
    STATE(7), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(21), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(50), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(12), 5,
      sym_inline_field,
      sym__measure_content,
      sym_note_cluster,
      sym_string,
      aux_sym_measure_repeat1,
  [263] = 9,
    ACTIONS(87), 1,
      anon_sym_LPAREN,
    ACTIONS(90), 1,
      sym_barline,
    ACTIONS(92), 1,
      sym_embellishment,
    ACTIONS(95), 1,
      anon_sym_LBRACE,
    ACTIONS(98), 1,
      sym_pitch,
    ACTIONS(101), 1,
      anon_sym_DQUOTE,
    STATE(21), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(50), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(11), 5,
      sym_inline_field,
      sym__measure_content,
      sym_note_cluster,
      sym_string,
      aux_sym_measure_repeat1,
  [297] = 9,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(23), 1,
      anon_sym_DQUOTE,
    ACTIONS(104), 1,
      sym_barline,
    STATE(21), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(50), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(11), 5,
      sym_inline_field,
      sym__measure_content,
      sym_note_cluster,
      sym_string,
      aux_sym_measure_repeat1,
  [331] = 1,
    ACTIONS(106), 10,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [344] = 1,
    ACTIONS(108), 10,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [357] = 1,
    ACTIONS(110), 10,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [370] = 1,
    ACTIONS(112), 10,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [383] = 1,
    ACTIONS(114), 10,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [396] = 1,
    ACTIONS(116), 10,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [409] = 1,
    ACTIONS(118), 10,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [422] = 6,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(7), 1,
      anon_sym_PERCENT,
    ACTIONS(120), 1,
      anon_sym_LF,
    STATE(2), 1,
      sym_header,
    STATE(33), 2,
      sym_tune,
      aux_sym_file_repeat2,
    STATE(28), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [444] = 6,
    ACTIONS(122), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(124), 1,
      sym_embellishment,
    ACTIONS(126), 1,
      anon_sym_LBRACE,
    ACTIONS(128), 1,
      sym_pitch,
    STATE(24), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(50), 2,
      sym__embellishment,
      sym_literal_embellishment,
  [465] = 1,
    ACTIONS(130), 8,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [476] = 1,
    ACTIONS(65), 8,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [487] = 6,
    ACTIONS(132), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(134), 1,
      sym_embellishment,
    ACTIONS(137), 1,
      anon_sym_LBRACE,
    ACTIONS(140), 1,
      sym_pitch,
    STATE(24), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(50), 2,
      sym__embellishment,
      sym_literal_embellishment,
  [508] = 1,
    ACTIONS(143), 6,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
  [517] = 1,
    ACTIONS(145), 6,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
  [526] = 2,
    ACTIONS(149), 1,
      sym_barline,
    ACTIONS(147), 5,
      anon_sym_LPAREN,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
  [537] = 4,
    ACTIONS(151), 1,
      anon_sym_LF,
    ACTIONS(154), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(156), 1,
      anon_sym_PERCENT,
    STATE(28), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [552] = 1,
    ACTIONS(159), 6,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
  [561] = 3,
    ACTIONS(161), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(165), 1,
      sym_duration,
    ACTIONS(163), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [573] = 3,
    ACTIONS(167), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(171), 1,
      sym_duration,
    ACTIONS(169), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [585] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(173), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(34), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [599] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(175), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(34), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [613] = 4,
    ACTIONS(177), 1,
      ts_builtin_sym_end,
    ACTIONS(179), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(2), 1,
      sym_header,
    STATE(34), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [627] = 4,
    ACTIONS(182), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(184), 1,
      sym_field_content,
    STATE(38), 1,
      aux_sym_header_repeat1,
    STATE(52), 1,
      sym_field,
  [640] = 2,
    ACTIONS(186), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(188), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [649] = 4,
    ACTIONS(190), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(192), 1,
      sym_field_content,
    STATE(37), 1,
      aux_sym_header_repeat1,
    STATE(52), 1,
      sym_field,
  [662] = 4,
    ACTIONS(184), 1,
      sym_field_content,
    ACTIONS(195), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(37), 1,
      aux_sym_header_repeat1,
    STATE(52), 1,
      sym_field,
  [675] = 2,
    ACTIONS(167), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(169), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [684] = 3,
    ACTIONS(197), 1,
      anon_sym_RBRACE,
    ACTIONS(199), 1,
      sym_pitch,
    STATE(40), 1,
      aux_sym_literal_embellishment_repeat1,
  [694] = 2,
    ACTIONS(204), 1,
      anon_sym_COLON,
    ACTIONS(202), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [702] = 3,
    ACTIONS(206), 1,
      anon_sym_RBRACE,
    ACTIONS(208), 1,
      sym_pitch,
    STATE(40), 1,
      aux_sym_literal_embellishment_repeat1,
  [712] = 2,
    ACTIONS(184), 1,
      sym_field_content,
    STATE(51), 1,
      sym_field,
  [719] = 2,
    ACTIONS(190), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(210), 1,
      sym_field_content,
  [726] = 1,
    ACTIONS(212), 2,
      ts_builtin_sym_end,
      anon_sym_DASH_DASH_DASH_LF,
  [731] = 1,
    ACTIONS(214), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [736] = 2,
    ACTIONS(216), 1,
      sym_pitch,
    STATE(42), 1,
      aux_sym_literal_embellishment_repeat1,
  [743] = 1,
    ACTIONS(218), 1,
      aux_sym_string_token1,
  [747] = 1,
    ACTIONS(220), 1,
      anon_sym_LF,
  [751] = 1,
    ACTIONS(222), 1,
      sym_pitch,
  [755] = 1,
    ACTIONS(224), 1,
      anon_sym_RPAREN,
  [759] = 1,
    ACTIONS(226), 1,
      anon_sym_LF,
  [763] = 1,
    ACTIONS(63), 1,
      anon_sym_LF,
  [767] = 1,
    ACTIONS(228), 1,
      sym_pitch,
  [771] = 1,
    ACTIONS(230), 1,
      anon_sym_DQUOTE,
  [775] = 1,
    ACTIONS(55), 1,
      anon_sym_LF,
  [779] = 1,
    ACTIONS(232), 1,
      sym_field_content,
  [783] = 1,
    ACTIONS(234), 1,
      aux_sym_comment_token1,
  [787] = 1,
    ACTIONS(236), 1,
      anon_sym_LF,
  [791] = 1,
    ACTIONS(238), 1,
      ts_builtin_sym_end,
  [795] = 1,
    ACTIONS(240), 1,
      anon_sym_LF,
  [799] = 1,
    ACTIONS(242), 1,
      aux_sym_comment_token1,
};

static const uint32_t ts_small_parse_table_map[] = {
  [SMALL_STATE(5)] = 0,
  [SMALL_STATE(6)] = 47,
  [SMALL_STATE(7)] = 94,
  [SMALL_STATE(8)] = 141,
  [SMALL_STATE(9)] = 183,
  [SMALL_STATE(10)] = 225,
  [SMALL_STATE(11)] = 263,
  [SMALL_STATE(12)] = 297,
  [SMALL_STATE(13)] = 331,
  [SMALL_STATE(14)] = 344,
  [SMALL_STATE(15)] = 357,
  [SMALL_STATE(16)] = 370,
  [SMALL_STATE(17)] = 383,
  [SMALL_STATE(18)] = 396,
  [SMALL_STATE(19)] = 409,
  [SMALL_STATE(20)] = 422,
  [SMALL_STATE(21)] = 444,
  [SMALL_STATE(22)] = 465,
  [SMALL_STATE(23)] = 476,
  [SMALL_STATE(24)] = 487,
  [SMALL_STATE(25)] = 508,
  [SMALL_STATE(26)] = 517,
  [SMALL_STATE(27)] = 526,
  [SMALL_STATE(28)] = 537,
  [SMALL_STATE(29)] = 552,
  [SMALL_STATE(30)] = 561,
  [SMALL_STATE(31)] = 573,
  [SMALL_STATE(32)] = 585,
  [SMALL_STATE(33)] = 599,
  [SMALL_STATE(34)] = 613,
  [SMALL_STATE(35)] = 627,
  [SMALL_STATE(36)] = 640,
  [SMALL_STATE(37)] = 649,
  [SMALL_STATE(38)] = 662,
  [SMALL_STATE(39)] = 675,
  [SMALL_STATE(40)] = 684,
  [SMALL_STATE(41)] = 694,
  [SMALL_STATE(42)] = 702,
  [SMALL_STATE(43)] = 712,
  [SMALL_STATE(44)] = 719,
  [SMALL_STATE(45)] = 726,
  [SMALL_STATE(46)] = 731,
  [SMALL_STATE(47)] = 736,
  [SMALL_STATE(48)] = 743,
  [SMALL_STATE(49)] = 747,
  [SMALL_STATE(50)] = 751,
  [SMALL_STATE(51)] = 755,
  [SMALL_STATE(52)] = 759,
  [SMALL_STATE(53)] = 763,
  [SMALL_STATE(54)] = 767,
  [SMALL_STATE(55)] = 771,
  [SMALL_STATE(56)] = 775,
  [SMALL_STATE(57)] = 779,
  [SMALL_STATE(58)] = 783,
  [SMALL_STATE(59)] = 787,
  [SMALL_STATE(60)] = 791,
  [SMALL_STATE(61)] = 795,
  [SMALL_STATE(62)] = 799,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, SHIFT(20),
  [5] = {.entry = {.count = 1, .reusable = true}}, SHIFT(35),
  [7] = {.entry = {.count = 1, .reusable = true}}, SHIFT(62),
  [9] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 1),
  [11] = {.entry = {.count = 1, .reusable = true}}, SHIFT(3),
  [13] = {.entry = {.count = 1, .reusable = true}}, SHIFT(43),
  [15] = {.entry = {.count = 1, .reusable = true}}, SHIFT(8),
  [17] = {.entry = {.count = 1, .reusable = true}}, SHIFT(50),
  [19] = {.entry = {.count = 1, .reusable = true}}, SHIFT(47),
  [21] = {.entry = {.count = 1, .reusable = true}}, SHIFT(30),
  [23] = {.entry = {.count = 1, .reusable = true}}, SHIFT(48),
  [25] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_body, 1),
  [27] = {.entry = {.count = 1, .reusable = true}}, SHIFT(4),
  [29] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2),
  [31] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(4),
  [34] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(43),
  [37] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(8),
  [40] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(50),
  [43] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(47),
  [46] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(30),
  [49] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(48),
  [52] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(62),
  [55] = {.entry = {.count = 1, .reusable = true}}, SHIFT(16),
  [57] = {.entry = {.count = 1, .reusable = true}}, SHIFT(23),
  [59] = {.entry = {.count = 1, .reusable = true}}, SHIFT(58),
  [61] = {.entry = {.count = 1, .reusable = true}}, SHIFT(18),
  [63] = {.entry = {.count = 1, .reusable = true}}, SHIFT(14),
  [65] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_measure, 1),
  [67] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2),
  [69] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(43),
  [72] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(23),
  [75] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(50),
  [78] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(47),
  [81] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(30),
  [84] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(48),
  [87] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(43),
  [90] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2),
  [92] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(50),
  [95] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(47),
  [98] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(30),
  [101] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(48),
  [104] = {.entry = {.count = 1, .reusable = true}}, SHIFT(22),
  [106] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment, 3),
  [108] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 4),
  [110] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 3),
  [112] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 3),
  [114] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 5),
  [116] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 2),
  [118] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 2),
  [120] = {.entry = {.count = 1, .reusable = true}}, SHIFT(28),
  [122] = {.entry = {.count = 1, .reusable = true}}, SHIFT(29),
  [124] = {.entry = {.count = 1, .reusable = false}}, SHIFT(50),
  [126] = {.entry = {.count = 1, .reusable = false}}, SHIFT(47),
  [128] = {.entry = {.count = 1, .reusable = false}}, SHIFT(30),
  [130] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_measure, 2),
  [132] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_note_cluster_repeat1, 2),
  [134] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(50),
  [137] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(47),
  [140] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(30),
  [143] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_string, 3),
  [145] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_inline_field, 3),
  [147] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__measure_content, 1),
  [149] = {.entry = {.count = 1, .reusable = true}}, SHIFT(10),
  [151] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(28),
  [154] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2),
  [156] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(62),
  [159] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note_cluster, 2),
  [161] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 1),
  [163] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 1),
  [165] = {.entry = {.count = 1, .reusable = false}}, SHIFT(39),
  [167] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2),
  [169] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2),
  [171] = {.entry = {.count = 1, .reusable = false}}, SHIFT(36),
  [173] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 1),
  [175] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 2),
  [177] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2),
  [179] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2), SHIFT_REPEAT(35),
  [182] = {.entry = {.count = 1, .reusable = false}}, SHIFT(19),
  [184] = {.entry = {.count = 1, .reusable = true}}, SHIFT(41),
  [186] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 3),
  [188] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 3),
  [190] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_header_repeat1, 2),
  [192] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2), SHIFT_REPEAT(41),
  [195] = {.entry = {.count = 1, .reusable = false}}, SHIFT(15),
  [197] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_literal_embellishment_repeat1, 2),
  [199] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_literal_embellishment_repeat1, 2), SHIFT_REPEAT(40),
  [202] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 1, .production_id = 1),
  [204] = {.entry = {.count = 1, .reusable = true}}, SHIFT(57),
  [206] = {.entry = {.count = 1, .reusable = true}}, SHIFT(54),
  [208] = {.entry = {.count = 1, .reusable = true}}, SHIFT(40),
  [210] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2),
  [212] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 2),
  [214] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 3, .production_id = 2),
  [216] = {.entry = {.count = 1, .reusable = true}}, SHIFT(42),
  [218] = {.entry = {.count = 1, .reusable = true}}, SHIFT(55),
  [220] = {.entry = {.count = 1, .reusable = true}}, SHIFT(13),
  [222] = {.entry = {.count = 1, .reusable = true}}, SHIFT(31),
  [224] = {.entry = {.count = 1, .reusable = true}}, SHIFT(26),
  [226] = {.entry = {.count = 1, .reusable = true}}, SHIFT(44),
  [228] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_literal_embellishment, 3),
  [230] = {.entry = {.count = 1, .reusable = true}}, SHIFT(25),
  [232] = {.entry = {.count = 1, .reusable = true}}, SHIFT(46),
  [234] = {.entry = {.count = 1, .reusable = true}}, SHIFT(59),
  [236] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tail_comment, 2),
  [238] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
  [240] = {.entry = {.count = 1, .reusable = true}}, SHIFT(17),
  [242] = {.entry = {.count = 1, .reusable = true}}, SHIFT(49),
};

#ifdef __cplusplus
extern "C" {
#endif
#ifdef _WIN32
#define extern __declspec(dllexport)
#endif

extern const TSLanguage *tree_sitter_bagfile(void) {
  static const TSLanguage language = {
    .version = LANGUAGE_VERSION,
    .symbol_count = SYMBOL_COUNT,
    .alias_count = ALIAS_COUNT,
    .token_count = TOKEN_COUNT,
    .external_token_count = EXTERNAL_TOKEN_COUNT,
    .state_count = STATE_COUNT,
    .large_state_count = LARGE_STATE_COUNT,
    .production_id_count = PRODUCTION_ID_COUNT,
    .field_count = FIELD_COUNT,
    .max_alias_sequence_length = MAX_ALIAS_SEQUENCE_LENGTH,
    .parse_table = &ts_parse_table[0][0],
    .small_parse_table = ts_small_parse_table,
    .small_parse_table_map = ts_small_parse_table_map,
    .parse_actions = ts_parse_actions,
    .symbol_names = ts_symbol_names,
    .field_names = ts_field_names,
    .field_map_slices = ts_field_map_slices,
    .field_map_entries = ts_field_map_entries,
    .symbol_metadata = ts_symbol_metadata,
    .public_symbol_map = ts_symbol_map,
    .alias_map = ts_non_terminal_alias_map,
    .alias_sequences = &ts_alias_sequences[0][0],
    .lex_modes = ts_lex_modes,
    .lex_fn = ts_lex,
    .primary_state_ids = ts_primary_state_ids,
  };
  return &language;
}
#ifdef __cplusplus
}
#endif
