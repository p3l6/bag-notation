#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 14
#define STATE_COUNT 64
#define LARGE_STATE_COUNT 5
#define SYMBOL_COUNT 41
#define ALIAS_COUNT 0
#define TOKEN_COUNT 17
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 6
#define MAX_ALIAS_SEQUENCE_LENGTH 5
#define PRODUCTION_ID_COUNT 11

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
  sym_tie = 14,
  anon_sym_PERCENT = 15,
  aux_sym_comment_token1 = 16,
  sym_file = 17,
  sym_tune = 18,
  sym_body = 19,
  sym_line = 20,
  sym_header = 21,
  sym__inline_field = 22,
  sym_field = 23,
  sym_measure = 24,
  sym__measure_content = 25,
  sym_note_cluster = 26,
  sym_note = 27,
  sym__embellishment = 28,
  sym_literal_embellishment = 29,
  sym__blank_line = 30,
  sym_comment = 31,
  sym_tail_comment = 32,
  aux_sym_file_repeat1 = 33,
  aux_sym_file_repeat2 = 34,
  aux_sym_body_repeat1 = 35,
  aux_sym_line_repeat1 = 36,
  aux_sym_header_repeat1 = 37,
  aux_sym_measure_repeat1 = 38,
  aux_sym_note_cluster_repeat1 = 39,
  aux_sym_literal_embellishment_repeat1 = 40,
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
  [sym_tie] = "tie",
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
  [sym_tie] = sym_tie,
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
  [sym_tie] = {
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
  field_tie = 5,
  field_value = 6,
};

static const char * const ts_field_names[] = {
  [0] = NULL,
  [field_duration] = "duration",
  [field_embellishment] = "embellishment",
  [field_label] = "label",
  [field_pitch] = "pitch",
  [field_tie] = "tie",
  [field_value] = "value",
};

static const TSFieldMapSlice ts_field_map_slices[PRODUCTION_ID_COUNT] = {
  [1] = {.index = 0, .length = 1},
  [2] = {.index = 1, .length = 1},
  [3] = {.index = 2, .length = 2},
  [4] = {.index = 4, .length = 2},
  [5] = {.index = 6, .length = 2},
  [6] = {.index = 8, .length = 2},
  [7] = {.index = 10, .length = 3},
  [8] = {.index = 13, .length = 3},
  [9] = {.index = 16, .length = 3},
  [10] = {.index = 19, .length = 4},
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
    {field_pitch, 0},
    {field_tie, 1},
  [6] =
    {field_embellishment, 0},
    {field_pitch, 1},
  [8] =
    {field_label, 0},
    {field_value, 2},
  [10] =
    {field_duration, 1},
    {field_pitch, 0},
    {field_tie, 2},
  [13] =
    {field_duration, 2},
    {field_embellishment, 0},
    {field_pitch, 1},
  [16] =
    {field_embellishment, 0},
    {field_pitch, 1},
    {field_tie, 2},
  [19] =
    {field_duration, 2},
    {field_embellishment, 0},
    {field_pitch, 1},
    {field_tie, 3},
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
  [63] = 63,
};

static bool ts_lex(TSLexer *lexer, TSStateId state) {
  START_LEXER();
  eof = lexer->eof(lexer);
  switch (state) {
    case 0:
      if (eof) ADVANCE(9);
      if (lookahead == '\n') ADVANCE(10);
      if (lookahead == '%') ADVANCE(27);
      if (lookahead == '(') ADVANCE(12);
      if (lookahead == ')') ADVANCE(13);
      if (lookahead == '-') ADVANCE(5);
      if (lookahead == ':') ADVANCE(15);
      if (lookahead == '_') ADVANCE(26);
      if (lookahead == '{') ADVANCE(22);
      if (lookahead == '|') ADVANCE(19);
      if (lookahead == '}') ADVANCE(23);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(0)
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(25);
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
      if (lookahead == '_') ADVANCE(26);
      if (lookahead == '{') ADVANCE(22);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(20);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(25);
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
      if (lookahead == '%') ADVANCE(27);
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
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(25);
      END_STATE();
    case 26:
      ACCEPT_TOKEN(sym_tie);
      END_STATE();
    case 27:
      ACCEPT_TOKEN(anon_sym_PERCENT);
      END_STATE();
    case 28:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(28);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(29);
      END_STATE();
    case 29:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(29);
      END_STATE();
    default:
      return false;
  }
}

static const TSLexMode ts_lex_modes[STATE_COUNT] = {
  [0] = {.lex_state = 0},
  [1] = {.lex_state = 0},
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
  [19] = {.lex_state = 0},
  [20] = {.lex_state = 8},
  [21] = {.lex_state = 8},
  [22] = {.lex_state = 6},
  [23] = {.lex_state = 6},
  [24] = {.lex_state = 8},
  [25] = {.lex_state = 8},
  [26] = {.lex_state = 6},
  [27] = {.lex_state = 6},
  [28] = {.lex_state = 0},
  [29] = {.lex_state = 8},
  [30] = {.lex_state = 6},
  [31] = {.lex_state = 6},
  [32] = {.lex_state = 0},
  [33] = {.lex_state = 0},
  [34] = {.lex_state = 0},
  [35] = {.lex_state = 8},
  [36] = {.lex_state = 1},
  [37] = {.lex_state = 1},
  [38] = {.lex_state = 6},
  [39] = {.lex_state = 1},
  [40] = {.lex_state = 6},
  [41] = {.lex_state = 6},
  [42] = {.lex_state = 6},
  [43] = {.lex_state = 0},
  [44] = {.lex_state = 2},
  [45] = {.lex_state = 0},
  [46] = {.lex_state = 0},
  [47] = {.lex_state = 1},
  [48] = {.lex_state = 0},
  [49] = {.lex_state = 1},
  [50] = {.lex_state = 0},
  [51] = {.lex_state = 0},
  [52] = {.lex_state = 0},
  [53] = {.lex_state = 0},
  [54] = {.lex_state = 0},
  [55] = {.lex_state = 0},
  [56] = {.lex_state = 0},
  [57] = {.lex_state = 28},
  [58] = {.lex_state = 0},
  [59] = {.lex_state = 0},
  [60] = {.lex_state = 0},
  [61] = {.lex_state = 0},
  [62] = {.lex_state = 1},
  [63] = {.lex_state = 28},
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
    [sym_tie] = ACTIONS(1),
    [anon_sym_PERCENT] = ACTIONS(1),
  },
  [1] = {
    [sym_file] = STATE(60),
    [sym_tune] = STATE(34),
    [sym_header] = STATE(2),
    [sym__blank_line] = STATE(19),
    [sym_comment] = STATE(19),
    [aux_sym_file_repeat1] = STATE(19),
    [aux_sym_file_repeat2] = STATE(34),
    [anon_sym_LF] = ACTIONS(3),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(5),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [2] = {
    [sym_body] = STATE(50),
    [sym_line] = STATE(3),
    [sym__inline_field] = STATE(11),
    [sym_measure] = STATE(6),
    [sym__measure_content] = STATE(13),
    [sym_note_cluster] = STATE(13),
    [sym_note] = STATE(23),
    [sym__embellishment] = STATE(58),
    [sym_literal_embellishment] = STATE(58),
    [sym__blank_line] = STATE(3),
    [sym_comment] = STATE(3),
    [aux_sym_body_repeat1] = STATE(3),
    [aux_sym_line_repeat1] = STATE(6),
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
    [sym_measure] = STATE(6),
    [sym__measure_content] = STATE(13),
    [sym_note_cluster] = STATE(13),
    [sym_note] = STATE(23),
    [sym__embellishment] = STATE(58),
    [sym_literal_embellishment] = STATE(58),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_body_repeat1] = STATE(4),
    [aux_sym_line_repeat1] = STATE(6),
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
    [sym_measure] = STATE(6),
    [sym__measure_content] = STATE(13),
    [sym_note_cluster] = STATE(13),
    [sym_note] = STATE(23),
    [sym__embellishment] = STATE(58),
    [sym_literal_embellishment] = STATE(58),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_body_repeat1] = STATE(4),
    [aux_sym_line_repeat1] = STATE(6),
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
    STATE(55), 1,
      sym_tail_comment,
    STATE(9), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(58), 2,
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
    STATE(54), 1,
      sym_tail_comment,
    STATE(9), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(58), 2,
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
    STATE(61), 1,
      sym_tail_comment,
    STATE(9), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(58), 2,
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
    STATE(5), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(58), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [167] = 10,
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
    STATE(9), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(58), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [205] = 10,
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
    STATE(58), 2,
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
    STATE(5), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(58), 2,
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
    STATE(58), 2,
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
    STATE(58), 2,
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
  [397] = 6,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(7), 1,
      anon_sym_PERCENT,
    ACTIONS(107), 1,
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
  [419] = 1,
    ACTIONS(109), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_PERCENT,
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
    STATE(58), 2,
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
    STATE(58), 2,
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
      aux_sym_note_cluster_token1,
    ACTIONS(138), 1,
      sym_duration,
    ACTIONS(140), 1,
      sym_tie,
    ACTIONS(136), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [520] = 4,
    ACTIONS(142), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(146), 1,
      sym_duration,
    ACTIONS(148), 1,
      sym_tie,
    ACTIONS(144), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [535] = 4,
    ACTIONS(150), 1,
      anon_sym_LF,
    ACTIONS(153), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(155), 1,
      anon_sym_PERCENT,
    STATE(28), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [550] = 1,
    ACTIONS(158), 5,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [558] = 3,
    ACTIONS(160), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(164), 1,
      sym_tie,
    ACTIONS(162), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [570] = 3,
    ACTIONS(166), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(170), 1,
      sym_tie,
    ACTIONS(168), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [582] = 4,
    ACTIONS(172), 1,
      ts_builtin_sym_end,
    ACTIONS(174), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(2), 1,
      sym_header,
    STATE(32), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [596] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(177), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(32), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [610] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(179), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(32), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [624] = 1,
    ACTIONS(181), 5,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [632] = 4,
    ACTIONS(183), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(185), 1,
      sym_field_content,
    STATE(37), 1,
      aux_sym_header_repeat1,
    STATE(53), 1,
      sym_field,
  [645] = 4,
    ACTIONS(187), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(189), 1,
      sym_field_content,
    STATE(37), 1,
      aux_sym_header_repeat1,
    STATE(53), 1,
      sym_field,
  [658] = 2,
    ACTIONS(192), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(194), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [667] = 4,
    ACTIONS(185), 1,
      sym_field_content,
    ACTIONS(196), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(36), 1,
      aux_sym_header_repeat1,
    STATE(53), 1,
      sym_field,
  [680] = 2,
    ACTIONS(198), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(200), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [689] = 2,
    ACTIONS(202), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(204), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [698] = 2,
    ACTIONS(206), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(208), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [707] = 3,
    ACTIONS(210), 1,
      anon_sym_RBRACE,
    ACTIONS(212), 1,
      sym_pitch,
    STATE(43), 1,
      aux_sym_literal_embellishment_repeat1,
  [717] = 2,
    ACTIONS(217), 1,
      anon_sym_COLON,
    ACTIONS(215), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [725] = 3,
    ACTIONS(219), 1,
      anon_sym_RBRACE,
    ACTIONS(221), 1,
      sym_pitch,
    STATE(43), 1,
      aux_sym_literal_embellishment_repeat1,
  [735] = 2,
    ACTIONS(223), 1,
      sym_pitch,
    STATE(45), 1,
      aux_sym_literal_embellishment_repeat1,
  [742] = 2,
    ACTIONS(185), 1,
      sym_field_content,
    STATE(52), 1,
      sym_field,
  [749] = 1,
    ACTIONS(225), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [754] = 2,
    ACTIONS(187), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(227), 1,
      sym_field_content,
  [761] = 1,
    ACTIONS(229), 2,
      ts_builtin_sym_end,
      anon_sym_DASH_DASH_DASH_LF,
  [766] = 1,
    ACTIONS(231), 1,
      anon_sym_LF,
  [770] = 1,
    ACTIONS(233), 1,
      anon_sym_RPAREN,
  [774] = 1,
    ACTIONS(235), 1,
      anon_sym_LF,
  [778] = 1,
    ACTIONS(50), 1,
      anon_sym_LF,
  [782] = 1,
    ACTIONS(58), 1,
      anon_sym_LF,
  [786] = 1,
    ACTIONS(237), 1,
      sym_pitch,
  [790] = 1,
    ACTIONS(239), 1,
      aux_sym_comment_token1,
  [794] = 1,
    ACTIONS(241), 1,
      sym_pitch,
  [798] = 1,
    ACTIONS(243), 1,
      anon_sym_LF,
  [802] = 1,
    ACTIONS(245), 1,
      ts_builtin_sym_end,
  [806] = 1,
    ACTIONS(247), 1,
      anon_sym_LF,
  [810] = 1,
    ACTIONS(249), 1,
      sym_field_content,
  [814] = 1,
    ACTIONS(251), 1,
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
  [SMALL_STATE(20)] = 419,
  [SMALL_STATE(21)] = 431,
  [SMALL_STATE(22)] = 443,
  [SMALL_STATE(23)] = 464,
  [SMALL_STATE(24)] = 485,
  [SMALL_STATE(25)] = 495,
  [SMALL_STATE(26)] = 505,
  [SMALL_STATE(27)] = 520,
  [SMALL_STATE(28)] = 535,
  [SMALL_STATE(29)] = 550,
  [SMALL_STATE(30)] = 558,
  [SMALL_STATE(31)] = 570,
  [SMALL_STATE(32)] = 582,
  [SMALL_STATE(33)] = 596,
  [SMALL_STATE(34)] = 610,
  [SMALL_STATE(35)] = 624,
  [SMALL_STATE(36)] = 632,
  [SMALL_STATE(37)] = 645,
  [SMALL_STATE(38)] = 658,
  [SMALL_STATE(39)] = 667,
  [SMALL_STATE(40)] = 680,
  [SMALL_STATE(41)] = 689,
  [SMALL_STATE(42)] = 698,
  [SMALL_STATE(43)] = 707,
  [SMALL_STATE(44)] = 717,
  [SMALL_STATE(45)] = 725,
  [SMALL_STATE(46)] = 735,
  [SMALL_STATE(47)] = 742,
  [SMALL_STATE(48)] = 749,
  [SMALL_STATE(49)] = 754,
  [SMALL_STATE(50)] = 761,
  [SMALL_STATE(51)] = 766,
  [SMALL_STATE(52)] = 770,
  [SMALL_STATE(53)] = 774,
  [SMALL_STATE(54)] = 778,
  [SMALL_STATE(55)] = 782,
  [SMALL_STATE(56)] = 786,
  [SMALL_STATE(57)] = 790,
  [SMALL_STATE(58)] = 794,
  [SMALL_STATE(59)] = 798,
  [SMALL_STATE(60)] = 802,
  [SMALL_STATE(61)] = 806,
  [SMALL_STATE(62)] = 810,
  [SMALL_STATE(63)] = 814,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, SHIFT(19),
  [5] = {.entry = {.count = 1, .reusable = true}}, SHIFT(39),
  [7] = {.entry = {.count = 1, .reusable = true}}, SHIFT(63),
  [9] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 1),
  [11] = {.entry = {.count = 1, .reusable = true}}, SHIFT(3),
  [13] = {.entry = {.count = 1, .reusable = true}}, SHIFT(47),
  [15] = {.entry = {.count = 1, .reusable = true}}, SHIFT(8),
  [17] = {.entry = {.count = 1, .reusable = true}}, SHIFT(58),
  [19] = {.entry = {.count = 1, .reusable = true}}, SHIFT(46),
  [21] = {.entry = {.count = 1, .reusable = true}}, SHIFT(26),
  [23] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_body, 1),
  [25] = {.entry = {.count = 1, .reusable = true}}, SHIFT(4),
  [27] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2),
  [29] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(4),
  [32] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(47),
  [35] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(8),
  [38] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(58),
  [41] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(46),
  [44] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(26),
  [47] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(63),
  [50] = {.entry = {.count = 1, .reusable = true}}, SHIFT(18),
  [52] = {.entry = {.count = 1, .reusable = true}}, SHIFT(25),
  [54] = {.entry = {.count = 1, .reusable = true}}, SHIFT(57),
  [56] = {.entry = {.count = 1, .reusable = true}}, SHIFT(16),
  [58] = {.entry = {.count = 1, .reusable = true}}, SHIFT(20),
  [60] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_measure, 1),
  [62] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2),
  [64] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(47),
  [67] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(25),
  [70] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(58),
  [73] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(46),
  [76] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(26),
  [79] = {.entry = {.count = 1, .reusable = true}}, SHIFT(10),
  [81] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(47),
  [84] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2),
  [86] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(58),
  [89] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(46),
  [92] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(26),
  [95] = {.entry = {.count = 1, .reusable = true}}, SHIFT(24),
  [97] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 2),
  [99] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 3),
  [101] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 2),
  [103] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 5),
  [105] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 3),
  [107] = {.entry = {.count = 1, .reusable = true}}, SHIFT(28),
  [109] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 4),
  [111] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment, 3),
  [113] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_note_cluster_repeat1, 2),
  [115] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(58),
  [118] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(46),
  [121] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(26),
  [124] = {.entry = {.count = 1, .reusable = true}}, SHIFT(29),
  [126] = {.entry = {.count = 1, .reusable = false}}, SHIFT(58),
  [128] = {.entry = {.count = 1, .reusable = false}}, SHIFT(46),
  [130] = {.entry = {.count = 1, .reusable = false}}, SHIFT(26),
  [132] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_measure, 2),
  [134] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 1, .production_id = 2),
  [136] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 1, .production_id = 2),
  [138] = {.entry = {.count = 1, .reusable = false}}, SHIFT(31),
  [140] = {.entry = {.count = 1, .reusable = false}}, SHIFT(41),
  [142] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2, .production_id = 5),
  [144] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2, .production_id = 5),
  [146] = {.entry = {.count = 1, .reusable = false}}, SHIFT(30),
  [148] = {.entry = {.count = 1, .reusable = false}}, SHIFT(40),
  [150] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(28),
  [153] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2),
  [155] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(63),
  [158] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note_cluster, 2),
  [160] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 3, .production_id = 8),
  [162] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 3, .production_id = 8),
  [164] = {.entry = {.count = 1, .reusable = false}}, SHIFT(38),
  [166] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2, .production_id = 3),
  [168] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2, .production_id = 3),
  [170] = {.entry = {.count = 1, .reusable = false}}, SHIFT(42),
  [172] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2),
  [174] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2), SHIFT_REPEAT(39),
  [177] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 2),
  [179] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 1),
  [181] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__inline_field, 3),
  [183] = {.entry = {.count = 1, .reusable = false}}, SHIFT(15),
  [185] = {.entry = {.count = 1, .reusable = true}}, SHIFT(44),
  [187] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_header_repeat1, 2),
  [189] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2), SHIFT_REPEAT(44),
  [192] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 4, .production_id = 10),
  [194] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 4, .production_id = 10),
  [196] = {.entry = {.count = 1, .reusable = false}}, SHIFT(14),
  [198] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 3, .production_id = 9),
  [200] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 3, .production_id = 9),
  [202] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2, .production_id = 4),
  [204] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2, .production_id = 4),
  [206] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 3, .production_id = 7),
  [208] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 3, .production_id = 7),
  [210] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_literal_embellishment_repeat1, 2),
  [212] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_literal_embellishment_repeat1, 2), SHIFT_REPEAT(43),
  [215] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 1, .production_id = 1),
  [217] = {.entry = {.count = 1, .reusable = true}}, SHIFT(62),
  [219] = {.entry = {.count = 1, .reusable = true}}, SHIFT(56),
  [221] = {.entry = {.count = 1, .reusable = true}}, SHIFT(43),
  [223] = {.entry = {.count = 1, .reusable = true}}, SHIFT(45),
  [225] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 3, .production_id = 6),
  [227] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2),
  [229] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 2),
  [231] = {.entry = {.count = 1, .reusable = true}}, SHIFT(21),
  [233] = {.entry = {.count = 1, .reusable = true}}, SHIFT(35),
  [235] = {.entry = {.count = 1, .reusable = true}}, SHIFT(49),
  [237] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_literal_embellishment, 3),
  [239] = {.entry = {.count = 1, .reusable = true}}, SHIFT(59),
  [241] = {.entry = {.count = 1, .reusable = true}}, SHIFT(27),
  [243] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tail_comment, 2),
  [245] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
  [247] = {.entry = {.count = 1, .reusable = true}}, SHIFT(17),
  [249] = {.entry = {.count = 1, .reusable = true}}, SHIFT(48),
  [251] = {.entry = {.count = 1, .reusable = true}}, SHIFT(51),
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
