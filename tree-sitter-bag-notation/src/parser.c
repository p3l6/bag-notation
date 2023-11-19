#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 14
#define STATE_COUNT 65
#define LARGE_STATE_COUNT 5
#define SYMBOL_COUNT 43
#define ALIAS_COUNT 0
#define TOKEN_COUNT 18
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 9
#define MAX_ALIAS_SEQUENCE_LENGTH 5
#define PRODUCTION_ID_COUNT 14

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
  field_body = 1,
  field_duration = 2,
  field_embellishment = 3,
  field_header = 4,
  field_label = 5,
  field_leading = 6,
  field_pitch = 7,
  field_tail_comment = 8,
  field_value = 9,
};

static const char * const ts_field_names[] = {
  [0] = NULL,
  [field_body] = "body",
  [field_duration] = "duration",
  [field_embellishment] = "embellishment",
  [field_header] = "header",
  [field_label] = "label",
  [field_leading] = "leading",
  [field_pitch] = "pitch",
  [field_tail_comment] = "tail_comment",
  [field_value] = "value",
};

static const TSFieldMapSlice ts_field_map_slices[PRODUCTION_ID_COUNT] = {
  [1] = {.index = 0, .length = 1},
  [2] = {.index = 1, .length = 1},
  [3] = {.index = 2, .length = 1},
  [4] = {.index = 3, .length = 2},
  [5] = {.index = 5, .length = 2},
  [6] = {.index = 7, .length = 2},
  [7] = {.index = 9, .length = 2},
  [8] = {.index = 11, .length = 1},
  [9] = {.index = 12, .length = 3},
  [10] = {.index = 15, .length = 1},
  [11] = {.index = 16, .length = 2},
  [12] = {.index = 18, .length = 2},
  [13] = {.index = 20, .length = 3},
};

static const TSFieldMapEntry ts_field_map_entries[] = {
  [0] =
    {field_header, 0},
  [1] =
    {field_value, 0},
  [2] =
    {field_pitch, 0},
  [3] =
    {field_body, 1},
    {field_header, 0},
  [5] =
    {field_duration, 1},
    {field_pitch, 0},
  [7] =
    {field_embellishment, 0},
    {field_pitch, 1},
  [9] =
    {field_label, 0},
    {field_value, 2},
  [11] =
    {field_leading, 0},
  [12] =
    {field_duration, 2},
    {field_embellishment, 0},
    {field_pitch, 1},
  [15] =
    {field_tail_comment, 1},
  [16] =
    {field_leading, 0},
    {field_tail_comment, 2},
  [18] =
    {field_leading, 0},
    {field_leading, 1},
  [20] =
    {field_leading, 0},
    {field_leading, 1},
    {field_tail_comment, 3},
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
  [64] = 64,
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
  [21] = {.lex_state = 8},
  [22] = {.lex_state = 8},
  [23] = {.lex_state = 6},
  [24] = {.lex_state = 8},
  [25] = {.lex_state = 8},
  [26] = {.lex_state = 6},
  [27] = {.lex_state = 8},
  [28] = {.lex_state = 8},
  [29] = {.lex_state = 8},
  [30] = {.lex_state = 8},
  [31] = {.lex_state = 8},
  [32] = {.lex_state = 8},
  [33] = {.lex_state = 8},
  [34] = {.lex_state = 8},
  [35] = {.lex_state = 6},
  [36] = {.lex_state = 6},
  [37] = {.lex_state = 1},
  [38] = {.lex_state = 6},
  [39] = {.lex_state = 1},
  [40] = {.lex_state = 6},
  [41] = {.lex_state = 1},
  [42] = {.lex_state = 2},
  [43] = {.lex_state = 0},
  [44] = {.lex_state = 0},
  [45] = {.lex_state = 0},
  [46] = {.lex_state = 1},
  [47] = {.lex_state = 1},
  [48] = {.lex_state = 8},
  [49] = {.lex_state = 0},
  [50] = {.lex_state = 0},
  [51] = {.lex_state = 0},
  [52] = {.lex_state = 7},
  [53] = {.lex_state = 0},
  [54] = {.lex_state = 0},
  [55] = {.lex_state = 0},
  [56] = {.lex_state = 0},
  [57] = {.lex_state = 1},
  [58] = {.lex_state = 0},
  [59] = {.lex_state = 0},
  [60] = {.lex_state = 0},
  [61] = {.lex_state = 32},
  [62] = {.lex_state = 0},
  [63] = {.lex_state = 0},
  [64] = {.lex_state = 32},
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
    [sym_file] = STATE(62),
    [sym_tune] = STATE(34),
    [sym_header] = STATE(2),
    [sym__blank_line] = STATE(22),
    [sym_comment] = STATE(22),
    [aux_sym_file_repeat1] = STATE(22),
    [aux_sym_file_repeat2] = STATE(34),
    [anon_sym_LF] = ACTIONS(3),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(5),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [2] = {
    [sym_body] = STATE(48),
    [sym_line] = STATE(4),
    [sym_inline_field] = STATE(30),
    [sym_measure] = STATE(6),
    [sym__measure_content] = STATE(12),
    [sym_note_cluster] = STATE(12),
    [sym_note] = STATE(23),
    [sym__embellishment] = STATE(55),
    [sym_literal_embellishment] = STATE(55),
    [sym_string] = STATE(12),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_body_repeat1] = STATE(4),
    [aux_sym_line_repeat1] = STATE(6),
    [aux_sym_measure_repeat1] = STATE(12),
    [aux_sym_note_cluster_repeat1] = STATE(23),
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
    [sym_line] = STATE(3),
    [sym_inline_field] = STATE(30),
    [sym_measure] = STATE(6),
    [sym__measure_content] = STATE(12),
    [sym_note_cluster] = STATE(12),
    [sym_note] = STATE(23),
    [sym__embellishment] = STATE(55),
    [sym_literal_embellishment] = STATE(55),
    [sym_string] = STATE(12),
    [sym__blank_line] = STATE(3),
    [sym_comment] = STATE(3),
    [aux_sym_body_repeat1] = STATE(3),
    [aux_sym_line_repeat1] = STATE(6),
    [aux_sym_measure_repeat1] = STATE(12),
    [aux_sym_note_cluster_repeat1] = STATE(23),
    [ts_builtin_sym_end] = ACTIONS(25),
    [anon_sym_LF] = ACTIONS(27),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(30),
    [sym_barline] = ACTIONS(33),
    [sym_embellishment] = ACTIONS(36),
    [anon_sym_LBRACE] = ACTIONS(39),
    [sym_pitch] = ACTIONS(42),
    [anon_sym_DQUOTE] = ACTIONS(45),
    [anon_sym_PERCENT] = ACTIONS(48),
  },
  [4] = {
    [sym_line] = STATE(3),
    [sym_inline_field] = STATE(30),
    [sym_measure] = STATE(6),
    [sym__measure_content] = STATE(12),
    [sym_note_cluster] = STATE(12),
    [sym_note] = STATE(23),
    [sym__embellishment] = STATE(55),
    [sym_literal_embellishment] = STATE(55),
    [sym_string] = STATE(12),
    [sym__blank_line] = STATE(3),
    [sym_comment] = STATE(3),
    [aux_sym_body_repeat1] = STATE(3),
    [aux_sym_line_repeat1] = STATE(6),
    [aux_sym_measure_repeat1] = STATE(12),
    [aux_sym_note_cluster_repeat1] = STATE(23),
    [ts_builtin_sym_end] = ACTIONS(51),
    [anon_sym_LF] = ACTIONS(53),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(51),
    [anon_sym_LPAREN] = ACTIONS(13),
    [sym_barline] = ACTIONS(15),
    [sym_embellishment] = ACTIONS(17),
    [anon_sym_LBRACE] = ACTIONS(19),
    [sym_pitch] = ACTIONS(21),
    [anon_sym_DQUOTE] = ACTIONS(23),
    [anon_sym_PERCENT] = ACTIONS(7),
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
    STATE(8), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(55), 2,
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
    STATE(50), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(55), 2,
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
    STATE(63), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(55), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(12), 5,
      sym_inline_field,
      sym__measure_content,
      sym_note_cluster,
      sym_string,
      aux_sym_measure_repeat1,
  [141] = 11,
    ACTIONS(67), 1,
      anon_sym_LPAREN,
    ACTIONS(70), 1,
      sym_barline,
    ACTIONS(73), 1,
      sym_embellishment,
    ACTIONS(76), 1,
      anon_sym_LBRACE,
    ACTIONS(79), 1,
      sym_pitch,
    ACTIONS(82), 1,
      anon_sym_DQUOTE,
    ACTIONS(65), 2,
      anon_sym_LF,
      anon_sym_PERCENT,
    STATE(8), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(55), 2,
      sym__embellishment,
      sym_literal_embellishment,
    STATE(12), 5,
      sym_inline_field,
      sym__measure_content,
      sym_note_cluster,
      sym_string,
      aux_sym_measure_repeat1,
  [183] = 11,
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
    ACTIONS(85), 2,
      anon_sym_LF,
      anon_sym_PERCENT,
    STATE(5), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(55), 2,
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
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(55), 2,
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
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(55), 2,
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
    STATE(23), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(55), 2,
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
  [422] = 1,
    ACTIONS(120), 10,
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
  [435] = 1,
    ACTIONS(122), 10,
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
  [448] = 6,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(7), 1,
      anon_sym_PERCENT,
    ACTIONS(124), 1,
      anon_sym_LF,
    STATE(2), 1,
      sym_header,
    STATE(32), 2,
      sym_tune,
      aux_sym_file_repeat2,
    STATE(28), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [470] = 6,
    ACTIONS(126), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(128), 1,
      sym_embellishment,
    ACTIONS(130), 1,
      anon_sym_LBRACE,
    ACTIONS(132), 1,
      sym_pitch,
    STATE(26), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(55), 2,
      sym__embellishment,
      sym_literal_embellishment,
  [491] = 1,
    ACTIONS(134), 8,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [502] = 1,
    ACTIONS(85), 8,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
      anon_sym_PERCENT,
  [513] = 6,
    ACTIONS(136), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(138), 1,
      sym_embellishment,
    ACTIONS(141), 1,
      anon_sym_LBRACE,
    ACTIONS(144), 1,
      sym_pitch,
    STATE(26), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(55), 2,
      sym__embellishment,
      sym_literal_embellishment,
  [534] = 1,
    ACTIONS(147), 6,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
  [543] = 4,
    ACTIONS(149), 1,
      anon_sym_LF,
    ACTIONS(152), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(154), 1,
      anon_sym_PERCENT,
    STATE(28), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [558] = 1,
    ACTIONS(157), 6,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
  [567] = 2,
    ACTIONS(161), 1,
      sym_barline,
    ACTIONS(159), 5,
      anon_sym_LPAREN,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
  [578] = 1,
    ACTIONS(163), 6,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
      anon_sym_DQUOTE,
  [587] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(165), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(33), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [601] = 4,
    ACTIONS(167), 1,
      ts_builtin_sym_end,
    ACTIONS(169), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(2), 1,
      sym_header,
    STATE(33), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [615] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(172), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(33), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [629] = 3,
    ACTIONS(174), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(178), 1,
      sym_duration,
    ACTIONS(176), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [641] = 3,
    ACTIONS(180), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(184), 1,
      sym_duration,
    ACTIONS(182), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [653] = 4,
    ACTIONS(186), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(188), 1,
      sym_field_content,
    STATE(37), 1,
      aux_sym_header_repeat1,
    STATE(60), 1,
      sym_field,
  [666] = 2,
    ACTIONS(191), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(193), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [675] = 4,
    ACTIONS(195), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(197), 1,
      sym_field_content,
    STATE(41), 1,
      aux_sym_header_repeat1,
    STATE(60), 1,
      sym_field,
  [688] = 2,
    ACTIONS(199), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(201), 3,
      sym_embellishment,
      anon_sym_LBRACE,
      sym_pitch,
  [697] = 4,
    ACTIONS(197), 1,
      sym_field_content,
    ACTIONS(203), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(37), 1,
      aux_sym_header_repeat1,
    STATE(60), 1,
      sym_field,
  [710] = 2,
    ACTIONS(207), 1,
      anon_sym_COLON,
    ACTIONS(205), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [718] = 3,
    ACTIONS(209), 1,
      anon_sym_RBRACE,
    ACTIONS(211), 1,
      sym_pitch,
    STATE(44), 1,
      aux_sym_literal_embellishment_repeat1,
  [728] = 3,
    ACTIONS(213), 1,
      anon_sym_RBRACE,
    ACTIONS(215), 1,
      sym_pitch,
    STATE(44), 1,
      aux_sym_literal_embellishment_repeat1,
  [738] = 1,
    ACTIONS(218), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [743] = 2,
    ACTIONS(186), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(220), 1,
      sym_field_content,
  [750] = 2,
    ACTIONS(197), 1,
      sym_field_content,
    STATE(51), 1,
      sym_field,
  [757] = 1,
    ACTIONS(222), 2,
      ts_builtin_sym_end,
      anon_sym_DASH_DASH_DASH_LF,
  [762] = 2,
    ACTIONS(224), 1,
      sym_pitch,
    STATE(43), 1,
      aux_sym_literal_embellishment_repeat1,
  [769] = 1,
    ACTIONS(226), 1,
      anon_sym_LF,
  [773] = 1,
    ACTIONS(228), 1,
      anon_sym_RPAREN,
  [777] = 1,
    ACTIONS(230), 1,
      aux_sym_string_token1,
  [781] = 1,
    ACTIONS(232), 1,
      anon_sym_LF,
  [785] = 1,
    ACTIONS(234), 1,
      sym_pitch,
  [789] = 1,
    ACTIONS(236), 1,
      sym_pitch,
  [793] = 1,
    ACTIONS(238), 1,
      anon_sym_LF,
  [797] = 1,
    ACTIONS(240), 1,
      sym_field_content,
  [801] = 1,
    ACTIONS(242), 1,
      anon_sym_DQUOTE,
  [805] = 1,
    ACTIONS(244), 1,
      anon_sym_LF,
  [809] = 1,
    ACTIONS(246), 1,
      anon_sym_LF,
  [813] = 1,
    ACTIONS(248), 1,
      aux_sym_comment_token1,
  [817] = 1,
    ACTIONS(250), 1,
      ts_builtin_sym_end,
  [821] = 1,
    ACTIONS(252), 1,
      anon_sym_LF,
  [825] = 1,
    ACTIONS(254), 1,
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
  [SMALL_STATE(21)] = 435,
  [SMALL_STATE(22)] = 448,
  [SMALL_STATE(23)] = 470,
  [SMALL_STATE(24)] = 491,
  [SMALL_STATE(25)] = 502,
  [SMALL_STATE(26)] = 513,
  [SMALL_STATE(27)] = 534,
  [SMALL_STATE(28)] = 543,
  [SMALL_STATE(29)] = 558,
  [SMALL_STATE(30)] = 567,
  [SMALL_STATE(31)] = 578,
  [SMALL_STATE(32)] = 587,
  [SMALL_STATE(33)] = 601,
  [SMALL_STATE(34)] = 615,
  [SMALL_STATE(35)] = 629,
  [SMALL_STATE(36)] = 641,
  [SMALL_STATE(37)] = 653,
  [SMALL_STATE(38)] = 666,
  [SMALL_STATE(39)] = 675,
  [SMALL_STATE(40)] = 688,
  [SMALL_STATE(41)] = 697,
  [SMALL_STATE(42)] = 710,
  [SMALL_STATE(43)] = 718,
  [SMALL_STATE(44)] = 728,
  [SMALL_STATE(45)] = 738,
  [SMALL_STATE(46)] = 743,
  [SMALL_STATE(47)] = 750,
  [SMALL_STATE(48)] = 757,
  [SMALL_STATE(49)] = 762,
  [SMALL_STATE(50)] = 769,
  [SMALL_STATE(51)] = 773,
  [SMALL_STATE(52)] = 777,
  [SMALL_STATE(53)] = 781,
  [SMALL_STATE(54)] = 785,
  [SMALL_STATE(55)] = 789,
  [SMALL_STATE(56)] = 793,
  [SMALL_STATE(57)] = 797,
  [SMALL_STATE(58)] = 801,
  [SMALL_STATE(59)] = 805,
  [SMALL_STATE(60)] = 809,
  [SMALL_STATE(61)] = 813,
  [SMALL_STATE(62)] = 817,
  [SMALL_STATE(63)] = 821,
  [SMALL_STATE(64)] = 825,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, SHIFT(22),
  [5] = {.entry = {.count = 1, .reusable = true}}, SHIFT(39),
  [7] = {.entry = {.count = 1, .reusable = true}}, SHIFT(64),
  [9] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 1, .production_id = 1),
  [11] = {.entry = {.count = 1, .reusable = true}}, SHIFT(4),
  [13] = {.entry = {.count = 1, .reusable = true}}, SHIFT(47),
  [15] = {.entry = {.count = 1, .reusable = true}}, SHIFT(9),
  [17] = {.entry = {.count = 1, .reusable = true}}, SHIFT(55),
  [19] = {.entry = {.count = 1, .reusable = true}}, SHIFT(49),
  [21] = {.entry = {.count = 1, .reusable = true}}, SHIFT(35),
  [23] = {.entry = {.count = 1, .reusable = true}}, SHIFT(52),
  [25] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2),
  [27] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(3),
  [30] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(47),
  [33] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(9),
  [36] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(55),
  [39] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(49),
  [42] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(35),
  [45] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(52),
  [48] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_body_repeat1, 2), SHIFT_REPEAT(64),
  [51] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_body, 1),
  [53] = {.entry = {.count = 1, .reusable = true}}, SHIFT(3),
  [55] = {.entry = {.count = 1, .reusable = true}}, SHIFT(21),
  [57] = {.entry = {.count = 1, .reusable = true}}, SHIFT(25),
  [59] = {.entry = {.count = 1, .reusable = true}}, SHIFT(61),
  [61] = {.entry = {.count = 1, .reusable = true}}, SHIFT(19),
  [63] = {.entry = {.count = 1, .reusable = true}}, SHIFT(15),
  [65] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2),
  [67] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(47),
  [70] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(25),
  [73] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(55),
  [76] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(49),
  [79] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(35),
  [82] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(52),
  [85] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_measure, 1),
  [87] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(47),
  [90] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2),
  [92] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(55),
  [95] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(49),
  [98] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(35),
  [101] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(52),
  [104] = {.entry = {.count = 1, .reusable = true}}, SHIFT(24),
  [106] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 3, .production_id = 10),
  [108] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 2),
  [110] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 4, .production_id = 12),
  [112] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 4, .production_id = 11),
  [114] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment, 3),
  [116] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 3),
  [118] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 2),
  [120] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 5, .production_id = 13),
  [122] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 3, .production_id = 8),
  [124] = {.entry = {.count = 1, .reusable = true}}, SHIFT(28),
  [126] = {.entry = {.count = 1, .reusable = true}}, SHIFT(31),
  [128] = {.entry = {.count = 1, .reusable = false}}, SHIFT(55),
  [130] = {.entry = {.count = 1, .reusable = false}}, SHIFT(49),
  [132] = {.entry = {.count = 1, .reusable = false}}, SHIFT(35),
  [134] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_measure, 2),
  [136] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_note_cluster_repeat1, 2),
  [138] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(55),
  [141] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(49),
  [144] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(35),
  [147] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_string, 3),
  [149] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(28),
  [152] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2),
  [154] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(64),
  [157] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_inline_field, 3),
  [159] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__measure_content, 1),
  [161] = {.entry = {.count = 1, .reusable = true}}, SHIFT(10),
  [163] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note_cluster, 2),
  [165] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 2),
  [167] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2),
  [169] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2), SHIFT_REPEAT(39),
  [172] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 1),
  [174] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 1, .production_id = 3),
  [176] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 1, .production_id = 3),
  [178] = {.entry = {.count = 1, .reusable = false}}, SHIFT(38),
  [180] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2, .production_id = 6),
  [182] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2, .production_id = 6),
  [184] = {.entry = {.count = 1, .reusable = false}}, SHIFT(40),
  [186] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_header_repeat1, 2),
  [188] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2), SHIFT_REPEAT(42),
  [191] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2, .production_id = 5),
  [193] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2, .production_id = 5),
  [195] = {.entry = {.count = 1, .reusable = false}}, SHIFT(14),
  [197] = {.entry = {.count = 1, .reusable = true}}, SHIFT(42),
  [199] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 3, .production_id = 9),
  [201] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 3, .production_id = 9),
  [203] = {.entry = {.count = 1, .reusable = false}}, SHIFT(18),
  [205] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 1, .production_id = 2),
  [207] = {.entry = {.count = 1, .reusable = true}}, SHIFT(57),
  [209] = {.entry = {.count = 1, .reusable = true}}, SHIFT(54),
  [211] = {.entry = {.count = 1, .reusable = true}}, SHIFT(44),
  [213] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_literal_embellishment_repeat1, 2),
  [215] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_literal_embellishment_repeat1, 2), SHIFT_REPEAT(44),
  [218] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 3, .production_id = 7),
  [220] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2),
  [222] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 2, .production_id = 4),
  [224] = {.entry = {.count = 1, .reusable = true}}, SHIFT(43),
  [226] = {.entry = {.count = 1, .reusable = true}}, SHIFT(13),
  [228] = {.entry = {.count = 1, .reusable = true}}, SHIFT(29),
  [230] = {.entry = {.count = 1, .reusable = true}}, SHIFT(58),
  [232] = {.entry = {.count = 1, .reusable = true}}, SHIFT(16),
  [234] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_literal_embellishment, 3),
  [236] = {.entry = {.count = 1, .reusable = true}}, SHIFT(36),
  [238] = {.entry = {.count = 1, .reusable = true}}, SHIFT(17),
  [240] = {.entry = {.count = 1, .reusable = true}}, SHIFT(45),
  [242] = {.entry = {.count = 1, .reusable = true}}, SHIFT(27),
  [244] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tail_comment, 2),
  [246] = {.entry = {.count = 1, .reusable = true}}, SHIFT(46),
  [248] = {.entry = {.count = 1, .reusable = true}}, SHIFT(59),
  [250] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
  [252] = {.entry = {.count = 1, .reusable = true}}, SHIFT(20),
  [254] = {.entry = {.count = 1, .reusable = true}}, SHIFT(56),
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
