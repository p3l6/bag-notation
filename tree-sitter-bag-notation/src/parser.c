#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 14
#define STATE_COUNT 60
#define LARGE_STATE_COUNT 5
#define SYMBOL_COUNT 40
#define ALIAS_COUNT 0
#define TOKEN_COUNT 16
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 5
#define MAX_ALIAS_SEQUENCE_LENGTH 5
#define PRODUCTION_ID_COUNT 7

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
  anon_sym_PERCENT = 14,
  aux_sym_comment_token1 = 15,
  sym_file = 16,
  sym_tune = 17,
  sym_body = 18,
  sym_line = 19,
  sym_header = 20,
  sym__inline_field = 21,
  sym_field = 22,
  sym_measure = 23,
  sym__measure_content = 24,
  sym_note_cluster = 25,
  sym_note = 26,
  sym__embellishment = 27,
  sym_literal_embellishment = 28,
  sym__blank_line = 29,
  sym_comment = 30,
  sym_tail_comment = 31,
  aux_sym_file_repeat1 = 32,
  aux_sym_file_repeat2 = 33,
  aux_sym_body_repeat1 = 34,
  aux_sym_line_repeat1 = 35,
  aux_sym_header_repeat1 = 36,
  aux_sym_measure_repeat1 = 37,
  aux_sym_note_cluster_repeat1 = 38,
  aux_sym_literal_embellishment_repeat1 = 39,
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
  [anon_sym_PERCENT] = "%",
  [aux_sym_comment_token1] = "comment_token1",
  [sym_file] = "file",
  [sym_tune] = "tune",
  [sym_body] = "body",
  [sym_line] = "line",
  [sym_header] = "header",
  [sym__inline_field] = "_inline_field",
  [sym_field] = "field",
  [sym_measure] = "measure",
  [sym__measure_content] = "_measure_content",
  [sym_note_cluster] = "note_cluster",
  [sym_note] = "note",
  [sym__embellishment] = "_embellishment",
  [sym_literal_embellishment] = "literal_embellishment",
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
  [anon_sym_PERCENT] = anon_sym_PERCENT,
  [aux_sym_comment_token1] = aux_sym_comment_token1,
  [sym_file] = sym_file,
  [sym_tune] = sym_tune,
  [sym_body] = sym_body,
  [sym_line] = sym_line,
  [sym_header] = sym_header,
  [sym__inline_field] = sym__inline_field,
  [sym_field] = sym_field,
  [sym_measure] = sym_measure,
  [sym__measure_content] = sym__measure_content,
  [sym_note_cluster] = sym_note_cluster,
  [sym_note] = sym_note,
  [sym__embellishment] = sym__embellishment,
  [sym_literal_embellishment] = sym_literal_embellishment,
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
  [sym__inline_field] = {
    .visible = false,
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
  field_duration = 1,
  field_embellishment = 2,
  field_label = 3,
  field_pitch = 4,
  field_value = 5,
};

static const char * const ts_field_names[] = {
  [0] = NULL,
  [field_duration] = "duration",
  [field_embellishment] = "embellishment",
  [field_label] = "label",
  [field_pitch] = "pitch",
  [field_value] = "value",
};

static const TSFieldMapSlice ts_field_map_slices[PRODUCTION_ID_COUNT] = {
  [1] = {.index = 0, .length = 1},
  [2] = {.index = 1, .length = 1},
  [3] = {.index = 2, .length = 2},
  [4] = {.index = 4, .length = 2},
  [5] = {.index = 6, .length = 2},
  [6] = {.index = 8, .length = 3},
};

static const TSFieldMapEntry ts_field_map_entries[] = {
  [0] =
    {field_label, 0},
  [1] =
    {field_pitch, 0},
  [2] =
    {field_duration, 1},
    {field_pitch, 0},
  [4] =
    {field_embellishment, 0},
    {field_pitch, 1},
  [6] =
    {field_label, 0},
    {field_value, 2},
  [8] =
    {field_duration, 2},
    {field_embellishment, 0},
    {field_pitch, 1},
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
};

static bool ts_lex(TSLexer *lexer, TSStateId state) {
  START_LEXER();
  eof = lexer->eof(lexer);
  switch (state) {
    case 0:
      if (eof) ADVANCE(9);
      if (lookahead == '\n') ADVANCE(10);
      if (lookahead == '%') ADVANCE(29);
      if (lookahead == '(') ADVANCE(12);
      if (lookahead == ')') ADVANCE(13);
      if (lookahead == '-') ADVANCE(27);
      if (lookahead == ':') ADVANCE(15);
      if (lookahead == '{') ADVANCE(22);
      if (lookahead == '|') ADVANCE(19);
      if (lookahead == '}') ADVANCE(23);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(0)
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(28);
      if (('a' <= lookahead && lookahead <= 'g') ||
          lookahead == 'q' ||
          lookahead == 'r') ADVANCE(24);
      if (lookahead == 'h' ||
          lookahead == 'k' ||
          lookahead == 'l' ||
          lookahead == 'n' ||
          lookahead == 'p' ||
          ('t' <= lookahead && lookahead <= 'x') ||
          lookahead == 'z') ADVANCE(21);
      END_STATE();
    case 1:
      if (lookahead == '\t') SKIP(1)
      if (lookahead == ' ') ADVANCE(16);
      if (lookahead == '-') ADVANCE(5);
      if (lookahead == '\'' ||
          lookahead == ',' ||
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
      if (lookahead == '{') ADVANCE(22);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(20);
      if (lookahead == '+' ||
          ('-' <= lookahead && lookahead <= '/')) ADVANCE(28);
      if (('a' <= lookahead && lookahead <= 'g') ||
          lookahead == 'q' ||
          lookahead == 'r') ADVANCE(24);
      if (lookahead == 'h' ||
          lookahead == 'k' ||
          lookahead == 'l' ||
          lookahead == 'n' ||
          lookahead == 'p' ||
          ('t' <= lookahead && lookahead <= 'x') ||
          lookahead == 'z') ADVANCE(21);
      END_STATE();
    case 7:
      if (lookahead == '|') ADVANCE(19);
      END_STATE();
    case 8:
      if (eof) ADVANCE(9);
      if (lookahead == '\n') ADVANCE(10);
      if (lookahead == '%') ADVANCE(29);
      if (lookahead == '(') ADVANCE(12);
      if (lookahead == '-') ADVANCE(5);
      if (lookahead == ':') ADVANCE(7);
      if (lookahead == '{') ADVANCE(22);
      if (lookahead == '|') ADVANCE(19);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(8)
      if (('a' <= lookahead && lookahead <= 'g') ||
          lookahead == 'q' ||
          lookahead == 'r') ADVANCE(24);
      if (lookahead == 'h' ||
          lookahead == 'k' ||
          lookahead == 'l' ||
          lookahead == 'n' ||
          lookahead == 'p' ||
          ('t' <= lookahead && lookahead <= 'x') ||
          lookahead == 'z') ADVANCE(21);
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
      if (lookahead == '|') ADVANCE(19);
      END_STATE();
    case 16:
      ACCEPT_TOKEN(sym_field_content);
      if (lookahead == ' ') ADVANCE(16);
      if (lookahead == '\'' ||
          lookahead == ',' ||
          ('/' <= lookahead && lookahead <= '9') ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(17);
      END_STATE();
    case 17:
      ACCEPT_TOKEN(sym_field_content);
      if (lookahead == ' ' ||
          lookahead == '\'' ||
          lookahead == ',' ||
          ('/' <= lookahead && lookahead <= '9') ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(17);
      END_STATE();
    case 18:
      ACCEPT_TOKEN(sym_barline);
      END_STATE();
    case 19:
      ACCEPT_TOKEN(sym_barline);
      if (lookahead == ':') ADVANCE(18);
      if (lookahead == '|') ADVANCE(19);
      END_STATE();
    case 20:
      ACCEPT_TOKEN(aux_sym_note_cluster_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(20);
      END_STATE();
    case 21:
      ACCEPT_TOKEN(sym_embellishment);
      if (lookahead == 'h' ||
          lookahead == 'k' ||
          lookahead == 'l' ||
          lookahead == 'n' ||
          lookahead == 'p' ||
          ('t' <= lookahead && lookahead <= 'x') ||
          lookahead == 'z') ADVANCE(21);
      END_STATE();
    case 22:
      ACCEPT_TOKEN(anon_sym_LBRACE);
      END_STATE();
    case 23:
      ACCEPT_TOKEN(anon_sym_RBRACE);
      END_STATE();
    case 24:
      ACCEPT_TOKEN(sym_pitch);
      END_STATE();
    case 25:
      ACCEPT_TOKEN(sym_duration);
      if (lookahead == '\n') ADVANCE(11);
      if (lookahead == '+' ||
          ('-' <= lookahead && lookahead <= '/')) ADVANCE(28);
      END_STATE();
    case 26:
      ACCEPT_TOKEN(sym_duration);
      if (lookahead == '-') ADVANCE(25);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(28);
      END_STATE();
    case 27:
      ACCEPT_TOKEN(sym_duration);
      if (lookahead == '-') ADVANCE(26);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(28);
      END_STATE();
    case 28:
      ACCEPT_TOKEN(sym_duration);
      if (lookahead == '+' ||
          ('-' <= lookahead && lookahead <= '/')) ADVANCE(28);
      END_STATE();
    case 29:
      ACCEPT_TOKEN(anon_sym_PERCENT);
      END_STATE();
    case 30:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(30);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(31);
      END_STATE();
    case 31:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(31);
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
  [21] = {.lex_state = 8},
  [22] = {.lex_state = 6},
  [23] = {.lex_state = 6},
  [24] = {.lex_state = 8},
  [25] = {.lex_state = 8},
  [26] = {.lex_state = 8},
  [27] = {.lex_state = 8},
  [28] = {.lex_state = 8},
  [29] = {.lex_state = 6},
  [30] = {.lex_state = 6},
  [31] = {.lex_state = 8},
  [32] = {.lex_state = 8},
  [33] = {.lex_state = 8},
  [34] = {.lex_state = 6},
  [35] = {.lex_state = 1},
  [36] = {.lex_state = 1},
  [37] = {.lex_state = 6},
  [38] = {.lex_state = 1},
  [39] = {.lex_state = 2},
  [40] = {.lex_state = 0},
  [41] = {.lex_state = 0},
  [42] = {.lex_state = 1},
  [43] = {.lex_state = 1},
  [44] = {.lex_state = 8},
  [45] = {.lex_state = 0},
  [46] = {.lex_state = 0},
  [47] = {.lex_state = 0},
  [48] = {.lex_state = 0},
  [49] = {.lex_state = 0},
  [50] = {.lex_state = 0},
  [51] = {.lex_state = 0},
  [52] = {.lex_state = 0},
  [53] = {.lex_state = 1},
  [54] = {.lex_state = 30},
  [55] = {.lex_state = 0},
  [56] = {.lex_state = 0},
  [57] = {.lex_state = 0},
  [58] = {.lex_state = 0},
  [59] = {.lex_state = 30},
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
    [anon_sym_PERCENT] = ACTIONS(1),
  },
  [1] = {
    [sym_file] = STATE(57),
    [sym_tune] = STATE(28),
    [sym_header] = STATE(2),
    [sym__blank_line] = STATE(20),
    [sym_comment] = STATE(20),
    [aux_sym_file_repeat1] = STATE(20),
    [aux_sym_file_repeat2] = STATE(28),
    [anon_sym_LF] = ACTIONS(3),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(5),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [2] = {
    [sym_body] = STATE(44),
    [sym_line] = STATE(3),
    [sym__inline_field] = STATE(11),
    [sym_measure] = STATE(5),
    [sym__measure_content] = STATE(13),
    [sym_note_cluster] = STATE(13),
    [sym_note] = STATE(23),
    [sym__embellishment] = STATE(48),
    [sym_literal_embellishment] = STATE(48),
    [sym__blank_line] = STATE(3),
    [sym_comment] = STATE(3),
    [aux_sym_body_repeat1] = STATE(3),
    [aux_sym_line_repeat1] = STATE(5),
    [aux_sym_measure_repeat1] = STATE(13),
    [aux_sym_note_cluster_repeat1] = STATE(23),
    [ts_builtin_sym_end] = ACTIONS(9),
    [anon_sym_LF] = ACTIONS(11),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(9),
    [anon_sym_LPAREN] = ACTIONS(13),
    [sym_barline] = ACTIONS(15),
    [sym_embellishment] = ACTIONS(17),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_pitch] = ACTIONS(21),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [3] = {
    [sym_line] = STATE(4),
    [sym__inline_field] = STATE(11),
    [sym_measure] = STATE(5),
    [sym__measure_content] = STATE(13),
    [sym_note_cluster] = STATE(13),
    [sym_note] = STATE(23),
    [sym__embellishment] = STATE(48),
    [sym_literal_embellishment] = STATE(48),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_body_repeat1] = STATE(4),
    [aux_sym_line_repeat1] = STATE(5),
    [aux_sym_measure_repeat1] = STATE(13),
    [aux_sym_note_cluster_repeat1] = STATE(23),
    [ts_builtin_sym_end] = ACTIONS(23),
    [anon_sym_LF] = ACTIONS(25),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(23),
    [anon_sym_LPAREN] = ACTIONS(13),
    [sym_barline] = ACTIONS(15),
    [sym_embellishment] = ACTIONS(17),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_pitch] = ACTIONS(21),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [4] = {
    [sym_line] = STATE(4),
    [sym__inline_field] = STATE(11),
    [sym_measure] = STATE(5),
    [sym__measure_content] = STATE(13),
    [sym_note_cluster] = STATE(13),
    [sym_note] = STATE(23),
    [sym__embellishment] = STATE(48),
    [sym_literal_embellishment] = STATE(48),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_body_repeat1] = STATE(4),
    [aux_sym_line_repeat1] = STATE(5),
    [aux_sym_measure_repeat1] = STATE(13),
    [aux_sym_note_cluster_repeat1] = STATE(23),
    [ts_builtin_sym_end] = ACTIONS(27),
    [anon_sym_LF] = ACTIONS(29),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(27),
    [anon_sym_LPAREN] = ACTIONS(32),
    [sym_barline] = ACTIONS(35),
    [sym_embellishment] = ACTIONS(38),
    [anon_sym_LBRACE] = ACTIONS(41),
    [sym_pitch] = ACTIONS(44),
    [anon_sym_PERCENT] = ACTIONS(47),
  },
};

static const uint16_t ts_small_parse_table[] = {
  [0] = 12,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(50), 1,
      anon_sym_LF,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(54), 1,
      anon_sym_PERCENT,
    STATE(49), 1,
      sym_tail_comment,
    STATE(10), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [43] = 12,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(54), 1,
      anon_sym_PERCENT,
    ACTIONS(56), 1,
      anon_sym_LF,
    STATE(58), 1,
      sym_tail_comment,
    STATE(10), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [86] = 12,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(54), 1,
      anon_sym_PERCENT,
    ACTIONS(58), 1,
      anon_sym_LF,
    STATE(51), 1,
      sym_tail_comment,
    STATE(10), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [129] = 10,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(60), 2,
      anon_sym_LF,
      anon_sym_PERCENT,
    STATE(6), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [167] = 10,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(60), 2,
      anon_sym_LF,
      anon_sym_PERCENT,
    STATE(7), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [205] = 10,
    ACTIONS(64), 1,
      anon_sym_LPAREN,
    ACTIONS(67), 1,
      sym_barline,
    ACTIONS(70), 1,
      sym_embellishment,
    ACTIONS(73), 1,
      anon_sym_LBRACE,
    ACTIONS(76), 1,
      sym_pitch,
    ACTIONS(62), 2,
      anon_sym_LF,
      anon_sym_PERCENT,
    STATE(10), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [243] = 9,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(79), 1,
      sym_barline,
    STATE(7), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [277] = 8,
    ACTIONS(81), 1,
      anon_sym_LPAREN,
    ACTIONS(84), 1,
      sym_barline,
    ACTIONS(86), 1,
      sym_embellishment,
    ACTIONS(89), 1,
      anon_sym_LBRACE,
    ACTIONS(92), 1,
      sym_pitch,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(12), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [307] = 8,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      anon_sym_LBRACE,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(95), 1,
      sym_barline,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(12), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [337] = 1,
    ACTIONS(97), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_PERCENT,
  [349] = 1,
    ACTIONS(99), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_PERCENT,
  [361] = 1,
    ACTIONS(101), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_PERCENT,
  [373] = 1,
    ACTIONS(103), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_PERCENT,
  [385] = 1,
    ACTIONS(105), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_PERCENT,
  [397] = 1,
    ACTIONS(107), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_PERCENT,
  [409] = 6,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(7), 1,
      anon_sym_PERCENT,
    ACTIONS(109), 1,
      anon_sym_LF,
    STATE(2), 1,
      sym_header,
    STATE(33), 2,
      sym_tune,
      aux_sym_file_repeat2,
    STATE(26), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [431] = 1,
    ACTIONS(111), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_PERCENT,
  [443] = 6,
    ACTIONS(113), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(115), 1,
      sym_embellishment,
    ACTIONS(118), 1,
      anon_sym_LBRACE,
    ACTIONS(121), 1,
      sym_pitch,
    STATE(22), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
  [464] = 6,
    ACTIONS(124), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(126), 1,
      sym_embellishment,
    ACTIONS(128), 1,
      anon_sym_LBRACE,
    ACTIONS(130), 1,
      sym_pitch,
    STATE(22), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(48), 2,
      sym__embellishment,
      sym_literal_embellishment,
  [485] = 1,
    ACTIONS(132), 7,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_PERCENT,
  [495] = 1,
    ACTIONS(60), 7,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_PERCENT,
  [505] = 4,
    ACTIONS(134), 1,
      anon_sym_LF,
    ACTIONS(137), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(139), 1,
      anon_sym_PERCENT,
    STATE(26), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [520] = 1,
    ACTIONS(142), 5,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [528] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(144), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(31), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [542] = 3,
    ACTIONS(146), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(150), 1,
      sym_duration,
    ACTIONS(148), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [554] = 3,
    ACTIONS(152), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(156), 1,
      sym_duration,
    ACTIONS(154), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [566] = 4,
    ACTIONS(158), 1,
      ts_builtin_sym_end,
    ACTIONS(160), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(2), 1,
      sym_header,
    STATE(31), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [580] = 1,
    ACTIONS(163), 5,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [588] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(165), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(31), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [602] = 2,
    ACTIONS(167), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(169), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [611] = 4,
    ACTIONS(171), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(173), 1,
      sym_field_content,
    STATE(35), 1,
      aux_sym_header_repeat1,
    STATE(50), 1,
      sym_field,
  [624] = 4,
    ACTIONS(176), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(178), 1,
      sym_field_content,
    STATE(38), 1,
      aux_sym_header_repeat1,
    STATE(50), 1,
      sym_field,
  [637] = 2,
    ACTIONS(180), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(182), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [646] = 4,
    ACTIONS(178), 1,
      sym_field_content,
    ACTIONS(184), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(35), 1,
      aux_sym_header_repeat1,
    STATE(50), 1,
      sym_field,
  [659] = 2,
    ACTIONS(188), 1,
      anon_sym_COLON,
    ACTIONS(186), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [667] = 3,
    ACTIONS(190), 1,
      anon_sym_RBRACE,
    ACTIONS(192), 1,
      sym_pitch,
    STATE(41), 1,
      aux_sym_literal_embellishment_repeat1,
  [677] = 3,
    ACTIONS(194), 1,
      anon_sym_RBRACE,
    ACTIONS(196), 1,
      sym_pitch,
    STATE(41), 1,
      aux_sym_literal_embellishment_repeat1,
  [687] = 2,
    ACTIONS(171), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(199), 1,
      sym_field_content,
  [694] = 2,
    ACTIONS(178), 1,
      sym_field_content,
    STATE(55), 1,
      sym_field,
  [701] = 1,
    ACTIONS(201), 2,
      ts_builtin_sym_end,
      anon_sym_DASH_DASH_DASH_LF,
  [706] = 2,
    ACTIONS(203), 1,
      sym_pitch,
    STATE(40), 1,
      aux_sym_literal_embellishment_repeat1,
  [713] = 1,
    ACTIONS(205), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [718] = 1,
    ACTIONS(207), 1,
      anon_sym_LF,
  [722] = 1,
    ACTIONS(209), 1,
      sym_pitch,
  [726] = 1,
    ACTIONS(58), 1,
      anon_sym_LF,
  [730] = 1,
    ACTIONS(211), 1,
      anon_sym_LF,
  [734] = 1,
    ACTIONS(56), 1,
      anon_sym_LF,
  [738] = 1,
    ACTIONS(213), 1,
      sym_pitch,
  [742] = 1,
    ACTIONS(215), 1,
      sym_field_content,
  [746] = 1,
    ACTIONS(217), 1,
      aux_sym_comment_token1,
  [750] = 1,
    ACTIONS(219), 1,
      anon_sym_RPAREN,
  [754] = 1,
    ACTIONS(221), 1,
      anon_sym_LF,
  [758] = 1,
    ACTIONS(223), 1,
      ts_builtin_sym_end,
  [762] = 1,
    ACTIONS(225), 1,
      anon_sym_LF,
  [766] = 1,
    ACTIONS(227), 1,
      aux_sym_comment_token1,
};

static const uint32_t ts_small_parse_table_map[] = {
  [SMALL_STATE(5)] = 0,
  [SMALL_STATE(6)] = 43,
  [SMALL_STATE(7)] = 86,
  [SMALL_STATE(8)] = 129,
  [SMALL_STATE(9)] = 167,
  [SMALL_STATE(10)] = 205,
  [SMALL_STATE(11)] = 243,
  [SMALL_STATE(12)] = 277,
  [SMALL_STATE(13)] = 307,
  [SMALL_STATE(14)] = 337,
  [SMALL_STATE(15)] = 349,
  [SMALL_STATE(16)] = 361,
  [SMALL_STATE(17)] = 373,
  [SMALL_STATE(18)] = 385,
  [SMALL_STATE(19)] = 397,
  [SMALL_STATE(20)] = 409,
  [SMALL_STATE(21)] = 431,
  [SMALL_STATE(22)] = 443,
  [SMALL_STATE(23)] = 464,
  [SMALL_STATE(24)] = 485,
  [SMALL_STATE(25)] = 495,
  [SMALL_STATE(26)] = 505,
  [SMALL_STATE(27)] = 520,
  [SMALL_STATE(28)] = 528,
  [SMALL_STATE(29)] = 542,
  [SMALL_STATE(30)] = 554,
  [SMALL_STATE(31)] = 566,
  [SMALL_STATE(32)] = 580,
  [SMALL_STATE(33)] = 588,
  [SMALL_STATE(34)] = 602,
  [SMALL_STATE(35)] = 611,
  [SMALL_STATE(36)] = 624,
  [SMALL_STATE(37)] = 637,
  [SMALL_STATE(38)] = 646,
  [SMALL_STATE(39)] = 659,
  [SMALL_STATE(40)] = 667,
  [SMALL_STATE(41)] = 677,
  [SMALL_STATE(42)] = 687,
  [SMALL_STATE(43)] = 694,
  [SMALL_STATE(44)] = 701,
  [SMALL_STATE(45)] = 706,
  [SMALL_STATE(46)] = 713,
  [SMALL_STATE(47)] = 718,
  [SMALL_STATE(48)] = 722,
  [SMALL_STATE(49)] = 726,
  [SMALL_STATE(50)] = 730,
  [SMALL_STATE(51)] = 734,
  [SMALL_STATE(52)] = 738,
  [SMALL_STATE(53)] = 742,
  [SMALL_STATE(54)] = 746,
  [SMALL_STATE(55)] = 750,
  [SMALL_STATE(56)] = 754,
  [SMALL_STATE(57)] = 758,
  [SMALL_STATE(58)] = 762,
  [SMALL_STATE(59)] = 766,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, SHIFT(20),
  [5] = {.entry = {.count = 1, .reusable = true}}, SHIFT(36),
  [7] = {.entry = {.count = 1, .reusable = true}}, SHIFT(59),
  [9] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 1),
  [11] = {.entry = {.count = 1, .reusable = true}}, SHIFT(3),
  [13] = {.entry = {.count = 1, .reusable = true}}, SHIFT(43),
  [15] = {.entry = {.count = 1, .reusable = true}}, SHIFT(9),
  [17] = {.entry = {.count = 1, .reusable = true}}, SHIFT(48),
  [19] = {.entry = {.count = 1, .reusable = true}}, SHIFT(45),
  [21] = {.entry = {.count = 1, .reusable = true}}, SHIFT(30),
  [23] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_body, 1),
  [25] = {.entry = {.count = 1, .reusable = true}}, SHIFT(4),
  [27] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2),
  [29] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(4),
  [32] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(43),
  [35] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(9),
  [38] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(48),
  [41] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(45),
  [44] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(30),
  [47] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(59),
  [50] = {.entry = {.count = 1, .reusable = true}}, SHIFT(15),
  [52] = {.entry = {.count = 1, .reusable = true}}, SHIFT(25),
  [54] = {.entry = {.count = 1, .reusable = true}}, SHIFT(54),
  [56] = {.entry = {.count = 1, .reusable = true}}, SHIFT(21),
  [58] = {.entry = {.count = 1, .reusable = true}}, SHIFT(17),
  [60] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_measure, 1),
  [62] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2),
  [64] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(43),
  [67] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(25),
  [70] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(48),
  [73] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(45),
  [76] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(30),
  [79] = {.entry = {.count = 1, .reusable = true}}, SHIFT(8),
  [81] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(43),
  [84] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2),
  [86] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(48),
  [89] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(45),
  [92] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(30),
  [95] = {.entry = {.count = 1, .reusable = true}}, SHIFT(24),
  [97] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 5),
  [99] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 2),
  [101] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 2),
  [103] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 3),
  [105] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 3),
  [107] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment, 3),
  [109] = {.entry = {.count = 1, .reusable = true}}, SHIFT(26),
  [111] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 4),
  [113] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_note_cluster_repeat1, 2),
  [115] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(48),
  [118] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(45),
  [121] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(30),
  [124] = {.entry = {.count = 1, .reusable = true}}, SHIFT(32),
  [126] = {.entry = {.count = 1, .reusable = false}}, SHIFT(48),
  [128] = {.entry = {.count = 1, .reusable = false}}, SHIFT(45),
  [130] = {.entry = {.count = 1, .reusable = false}}, SHIFT(30),
  [132] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_measure, 2),
  [134] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(26),
  [137] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2),
  [139] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(59),
  [142] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__inline_field, 3),
  [144] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 1),
  [146] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2, .production_id = 4),
  [148] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2, .production_id = 4),
  [150] = {.entry = {.count = 1, .reusable = false}}, SHIFT(34),
  [152] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 1, .production_id = 2),
  [154] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 1, .production_id = 2),
  [156] = {.entry = {.count = 1, .reusable = false}}, SHIFT(37),
  [158] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2),
  [160] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2), SHIFT_REPEAT(36),
  [163] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note_cluster, 2),
  [165] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 2),
  [167] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 3, .production_id = 6),
  [169] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 3, .production_id = 6),
  [171] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_header_repeat1, 2),
  [173] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2), SHIFT_REPEAT(39),
  [176] = {.entry = {.count = 1, .reusable = false}}, SHIFT(16),
  [178] = {.entry = {.count = 1, .reusable = true}}, SHIFT(39),
  [180] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2, .production_id = 3),
  [182] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2, .production_id = 3),
  [184] = {.entry = {.count = 1, .reusable = false}}, SHIFT(18),
  [186] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 1, .production_id = 1),
  [188] = {.entry = {.count = 1, .reusable = true}}, SHIFT(53),
  [190] = {.entry = {.count = 1, .reusable = true}}, SHIFT(52),
  [192] = {.entry = {.count = 1, .reusable = true}}, SHIFT(41),
  [194] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_literal_embellishment_repeat1, 2),
  [196] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_literal_embellishment_repeat1, 2), SHIFT_REPEAT(41),
  [199] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2),
  [201] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 2),
  [203] = {.entry = {.count = 1, .reusable = true}}, SHIFT(40),
  [205] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 3, .production_id = 5),
  [207] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tail_comment, 2),
  [209] = {.entry = {.count = 1, .reusable = true}}, SHIFT(29),
  [211] = {.entry = {.count = 1, .reusable = true}}, SHIFT(42),
  [213] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_literal_embellishment, 3),
  [215] = {.entry = {.count = 1, .reusable = true}}, SHIFT(46),
  [217] = {.entry = {.count = 1, .reusable = true}}, SHIFT(47),
  [219] = {.entry = {.count = 1, .reusable = true}}, SHIFT(27),
  [221] = {.entry = {.count = 1, .reusable = true}}, SHIFT(19),
  [223] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
  [225] = {.entry = {.count = 1, .reusable = true}}, SHIFT(14),
  [227] = {.entry = {.count = 1, .reusable = true}}, SHIFT(56),
};

#ifdef __cplusplus
extern "C" {
#endif
#ifdef _WIN32
#define extern __declspec(dllexport)
#endif

extern const TSLanguage *tree_sitter_BagNotation(void) {
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
