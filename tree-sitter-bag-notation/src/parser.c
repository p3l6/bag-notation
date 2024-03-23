#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 14
#define STATE_COUNT 60
#define LARGE_STATE_COUNT 5
#define SYMBOL_COUNT 37
#define ALIAS_COUNT 0
#define TOKEN_COUNT 15
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 0
#define MAX_ALIAS_SEQUENCE_LENGTH 5
#define PRODUCTION_ID_COUNT 1

enum {
  anon_sym_LF = 1,
  anon_sym_DASH_DASH_DASH_LF = 2,
  anon_sym_LPAREN = 3,
  anon_sym_RPAREN = 4,
  anon_sym_COLON = 5,
  aux_sym_field_label_token1 = 6,
  sym_barline = 7,
  aux_sym_note_cluster_token1 = 8,
  sym_embellishment = 9,
  sym_pitch = 10,
  sym_duration = 11,
  sym_tie = 12,
  anon_sym_PERCENT = 13,
  aux_sym_comment_token1 = 14,
  sym_file = 15,
  sym_tune = 16,
  aux_sym__body = 17,
  sym_line = 18,
  sym_header = 19,
  sym__inline_field = 20,
  sym_field = 21,
  sym_field_label = 22,
  sym_field_value = 23,
  sym_measure = 24,
  sym__measure_content = 25,
  sym_note_cluster = 26,
  sym_note = 27,
  sym__blank_line = 28,
  sym_comment = 29,
  sym_tail_comment = 30,
  aux_sym_file_repeat1 = 31,
  aux_sym_file_repeat2 = 32,
  aux_sym_line_repeat1 = 33,
  aux_sym_header_repeat1 = 34,
  aux_sym_measure_repeat1 = 35,
  aux_sym_note_cluster_repeat1 = 36,
};

static const char * const ts_symbol_names[] = {
  [ts_builtin_sym_end] = "end",
  [anon_sym_LF] = "\n",
  [anon_sym_DASH_DASH_DASH_LF] = "---\n",
  [anon_sym_LPAREN] = "(",
  [anon_sym_RPAREN] = ")",
  [anon_sym_COLON] = ":",
  [aux_sym_field_label_token1] = "field_label_token1",
  [sym_barline] = "barline",
  [aux_sym_note_cluster_token1] = "note_cluster_token1",
  [sym_embellishment] = "embellishment",
  [sym_pitch] = "pitch",
  [sym_duration] = "duration",
  [sym_tie] = "tie",
  [anon_sym_PERCENT] = "%",
  [aux_sym_comment_token1] = "comment_token1",
  [sym_file] = "file",
  [sym_tune] = "tune",
  [aux_sym__body] = "_body",
  [sym_line] = "line",
  [sym_header] = "header",
  [sym__inline_field] = "_inline_field",
  [sym_field] = "field",
  [sym_field_label] = "field_label",
  [sym_field_value] = "field_value",
  [sym_measure] = "measure",
  [sym__measure_content] = "_measure_content",
  [sym_note_cluster] = "note_cluster",
  [sym_note] = "note",
  [sym__blank_line] = "_blank_line",
  [sym_comment] = "comment",
  [sym_tail_comment] = "tail_comment",
  [aux_sym_file_repeat1] = "file_repeat1",
  [aux_sym_file_repeat2] = "file_repeat2",
  [aux_sym_line_repeat1] = "line_repeat1",
  [aux_sym_header_repeat1] = "header_repeat1",
  [aux_sym_measure_repeat1] = "measure_repeat1",
  [aux_sym_note_cluster_repeat1] = "note_cluster_repeat1",
};

static const TSSymbol ts_symbol_map[] = {
  [ts_builtin_sym_end] = ts_builtin_sym_end,
  [anon_sym_LF] = anon_sym_LF,
  [anon_sym_DASH_DASH_DASH_LF] = anon_sym_DASH_DASH_DASH_LF,
  [anon_sym_LPAREN] = anon_sym_LPAREN,
  [anon_sym_RPAREN] = anon_sym_RPAREN,
  [anon_sym_COLON] = anon_sym_COLON,
  [aux_sym_field_label_token1] = aux_sym_field_label_token1,
  [sym_barline] = sym_barline,
  [aux_sym_note_cluster_token1] = aux_sym_note_cluster_token1,
  [sym_embellishment] = sym_embellishment,
  [sym_pitch] = sym_pitch,
  [sym_duration] = sym_duration,
  [sym_tie] = sym_tie,
  [anon_sym_PERCENT] = anon_sym_PERCENT,
  [aux_sym_comment_token1] = aux_sym_comment_token1,
  [sym_file] = sym_file,
  [sym_tune] = sym_tune,
  [aux_sym__body] = aux_sym__body,
  [sym_line] = sym_line,
  [sym_header] = sym_header,
  [sym__inline_field] = sym__inline_field,
  [sym_field] = sym_field,
  [sym_field_label] = sym_field_label,
  [sym_field_value] = sym_field_value,
  [sym_measure] = sym_measure,
  [sym__measure_content] = sym__measure_content,
  [sym_note_cluster] = sym_note_cluster,
  [sym_note] = sym_note,
  [sym__blank_line] = sym__blank_line,
  [sym_comment] = sym_comment,
  [sym_tail_comment] = sym_tail_comment,
  [aux_sym_file_repeat1] = aux_sym_file_repeat1,
  [aux_sym_file_repeat2] = aux_sym_file_repeat2,
  [aux_sym_line_repeat1] = aux_sym_line_repeat1,
  [aux_sym_header_repeat1] = aux_sym_header_repeat1,
  [aux_sym_measure_repeat1] = aux_sym_measure_repeat1,
  [aux_sym_note_cluster_repeat1] = aux_sym_note_cluster_repeat1,
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
  [aux_sym_field_label_token1] = {
    .visible = false,
    .named = false,
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
  [aux_sym__body] = {
    .visible = false,
    .named = false,
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
  [sym_field_label] = {
    .visible = true,
    .named = true,
  },
  [sym_field_value] = {
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
      if (lookahead == '%') ADVANCE(26);
      if (lookahead == '(') ADVANCE(12);
      if (lookahead == ')') ADVANCE(13);
      if (lookahead == '-') ADVANCE(25);
      if (lookahead == ':') ADVANCE(15);
      if (lookahead == '|') ADVANCE(19);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(0)
      if (lookahead == '_' ||
          lookahead == '~') ADVANCE(24);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(23);
      if (('a' <= lookahead && lookahead <= 'h') ||
          lookahead == 'l') ADVANCE(22);
      if (('j' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(21);
      END_STATE();
    case 1:
      if (lookahead == '\t') SKIP(1)
      if (lookahead == ' ') ADVANCE(16);
      if (lookahead == '-') ADVANCE(4);
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
      if (lookahead == '-') ADVANCE(5);
      END_STATE();
    case 5:
      if (lookahead == '-') ADVANCE(3);
      END_STATE();
    case 6:
      if (lookahead == '|') ADVANCE(19);
      END_STATE();
    case 7:
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(20);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(23);
      if (lookahead == '-' ||
          lookahead == '_' ||
          lookahead == '~') ADVANCE(24);
      if (('a' <= lookahead && lookahead <= 'h') ||
          lookahead == 'l') ADVANCE(22);
      if (('j' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(21);
      END_STATE();
    case 8:
      if (eof) ADVANCE(9);
      if (lookahead == '\n') ADVANCE(10);
      if (lookahead == '%') ADVANCE(26);
      if (lookahead == '(') ADVANCE(12);
      if (lookahead == '-') ADVANCE(4);
      if (lookahead == ':') ADVANCE(6);
      if (lookahead == '|') ADVANCE(19);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(8)
      if (('a' <= lookahead && lookahead <= 'h') ||
          lookahead == 'l') ADVANCE(22);
      if (('j' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(21);
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
      ACCEPT_TOKEN(aux_sym_field_label_token1);
      if (lookahead == ' ') ADVANCE(16);
      if (lookahead == '\'' ||
          lookahead == ',' ||
          ('/' <= lookahead && lookahead <= '9') ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(17);
      END_STATE();
    case 17:
      ACCEPT_TOKEN(aux_sym_field_label_token1);
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
      if (lookahead == 'j' ||
          lookahead == 'k' ||
          ('m' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(21);
      END_STATE();
    case 22:
      ACCEPT_TOKEN(sym_pitch);
      END_STATE();
    case 23:
      ACCEPT_TOKEN(sym_duration);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(23);
      END_STATE();
    case 24:
      ACCEPT_TOKEN(sym_tie);
      END_STATE();
    case 25:
      ACCEPT_TOKEN(sym_tie);
      if (lookahead == '-') ADVANCE(5);
      END_STATE();
    case 26:
      ACCEPT_TOKEN(anon_sym_PERCENT);
      END_STATE();
    case 27:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(27);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(28);
      END_STATE();
    case 28:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(28);
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
  [23] = {.lex_state = 8},
  [24] = {.lex_state = 8},
  [25] = {.lex_state = 7},
  [26] = {.lex_state = 1},
  [27] = {.lex_state = 8},
  [28] = {.lex_state = 8},
  [29] = {.lex_state = 1},
  [30] = {.lex_state = 8},
  [31] = {.lex_state = 1},
  [32] = {.lex_state = 7},
  [33] = {.lex_state = 7},
  [34] = {.lex_state = 7},
  [35] = {.lex_state = 7},
  [36] = {.lex_state = 7},
  [37] = {.lex_state = 8},
  [38] = {.lex_state = 8},
  [39] = {.lex_state = 2},
  [40] = {.lex_state = 2},
  [41] = {.lex_state = 1},
  [42] = {.lex_state = 7},
  [43] = {.lex_state = 7},
  [44] = {.lex_state = 7},
  [45] = {.lex_state = 1},
  [46] = {.lex_state = 0},
  [47] = {.lex_state = 0},
  [48] = {.lex_state = 1},
  [49] = {.lex_state = 27},
  [50] = {.lex_state = 0},
  [51] = {.lex_state = 0},
  [52] = {.lex_state = 0},
  [53] = {.lex_state = 0},
  [54] = {.lex_state = 0},
  [55] = {.lex_state = 0},
  [56] = {.lex_state = 0},
  [57] = {.lex_state = 0},
  [58] = {.lex_state = 0},
  [59] = {.lex_state = 27},
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
    [sym_pitch] = ACTIONS(1),
    [sym_duration] = ACTIONS(1),
    [sym_tie] = ACTIONS(1),
    [anon_sym_PERCENT] = ACTIONS(1),
  },
  [1] = {
    [sym_file] = STATE(57),
    [sym_tune] = STATE(28),
    [sym_header] = STATE(3),
    [sym__blank_line] = STATE(14),
    [sym_comment] = STATE(14),
    [aux_sym_file_repeat1] = STATE(14),
    [aux_sym_file_repeat2] = STATE(28),
    [anon_sym_LF] = ACTIONS(3),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(5),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [2] = {
    [aux_sym__body] = STATE(4),
    [sym_line] = STATE(4),
    [sym__inline_field] = STATE(11),
    [sym_measure] = STATE(5),
    [sym__measure_content] = STATE(13),
    [sym_note_cluster] = STATE(13),
    [sym_note] = STATE(32),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_line_repeat1] = STATE(5),
    [aux_sym_measure_repeat1] = STATE(13),
    [aux_sym_note_cluster_repeat1] = STATE(32),
    [ts_builtin_sym_end] = ACTIONS(9),
    [anon_sym_LF] = ACTIONS(11),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(9),
    [anon_sym_LPAREN] = ACTIONS(13),
    [sym_barline] = ACTIONS(15),
    [sym_embellishment] = ACTIONS(17),
    [sym_pitch] = ACTIONS(19),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [3] = {
    [aux_sym__body] = STATE(2),
    [sym_line] = STATE(2),
    [sym__inline_field] = STATE(11),
    [sym_measure] = STATE(5),
    [sym__measure_content] = STATE(13),
    [sym_note_cluster] = STATE(13),
    [sym_note] = STATE(32),
    [sym__blank_line] = STATE(2),
    [sym_comment] = STATE(2),
    [aux_sym_line_repeat1] = STATE(5),
    [aux_sym_measure_repeat1] = STATE(13),
    [aux_sym_note_cluster_repeat1] = STATE(32),
    [ts_builtin_sym_end] = ACTIONS(21),
    [anon_sym_LF] = ACTIONS(23),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(21),
    [anon_sym_LPAREN] = ACTIONS(13),
    [sym_barline] = ACTIONS(15),
    [sym_embellishment] = ACTIONS(17),
    [sym_pitch] = ACTIONS(19),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [4] = {
    [aux_sym__body] = STATE(4),
    [sym_line] = STATE(4),
    [sym__inline_field] = STATE(11),
    [sym_measure] = STATE(5),
    [sym__measure_content] = STATE(13),
    [sym_note_cluster] = STATE(13),
    [sym_note] = STATE(32),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_line_repeat1] = STATE(5),
    [aux_sym_measure_repeat1] = STATE(13),
    [aux_sym_note_cluster_repeat1] = STATE(32),
    [ts_builtin_sym_end] = ACTIONS(25),
    [anon_sym_LF] = ACTIONS(27),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(25),
    [anon_sym_LPAREN] = ACTIONS(30),
    [sym_barline] = ACTIONS(33),
    [sym_embellishment] = ACTIONS(36),
    [sym_pitch] = ACTIONS(39),
    [anon_sym_PERCENT] = ACTIONS(42),
  },
};

static const uint16_t ts_small_parse_table[] = {
  [0] = 10,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      sym_pitch,
    ACTIONS(45), 1,
      anon_sym_LF,
    ACTIONS(47), 1,
      sym_barline,
    ACTIONS(49), 1,
      anon_sym_PERCENT,
    STATE(50), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(32), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [36] = 10,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      sym_pitch,
    ACTIONS(47), 1,
      sym_barline,
    ACTIONS(49), 1,
      anon_sym_PERCENT,
    ACTIONS(51), 1,
      anon_sym_LF,
    STATE(58), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(32), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [72] = 10,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      sym_pitch,
    ACTIONS(47), 1,
      sym_barline,
    ACTIONS(49), 1,
      anon_sym_PERCENT,
    ACTIONS(53), 1,
      anon_sym_LF,
    STATE(54), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(32), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [108] = 8,
    ACTIONS(57), 1,
      anon_sym_LPAREN,
    ACTIONS(60), 1,
      sym_barline,
    ACTIONS(63), 1,
      sym_embellishment,
    ACTIONS(66), 1,
      sym_pitch,
    ACTIONS(55), 2,
      anon_sym_LF,
      anon_sym_PERCENT,
    STATE(8), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(32), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [139] = 8,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      sym_pitch,
    ACTIONS(47), 1,
      sym_barline,
    ACTIONS(69), 2,
      anon_sym_LF,
      anon_sym_PERCENT,
    STATE(6), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(32), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [170] = 8,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      sym_pitch,
    ACTIONS(47), 1,
      sym_barline,
    ACTIONS(69), 2,
      anon_sym_LF,
      anon_sym_PERCENT,
    STATE(7), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(32), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [201] = 7,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      sym_pitch,
    ACTIONS(71), 1,
      sym_barline,
    STATE(7), 2,
      sym_measure,
      aux_sym_line_repeat1,
    STATE(32), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(13), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [228] = 6,
    ACTIONS(73), 1,
      anon_sym_LPAREN,
    ACTIONS(76), 1,
      sym_barline,
    ACTIONS(78), 1,
      sym_embellishment,
    ACTIONS(81), 1,
      sym_pitch,
    STATE(32), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(12), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [251] = 6,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      sym_pitch,
    ACTIONS(84), 1,
      sym_barline,
    STATE(32), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
    STATE(12), 4,
      sym__inline_field,
      sym__measure_content,
      sym_note_cluster,
      aux_sym_measure_repeat1,
  [274] = 6,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(7), 1,
      anon_sym_PERCENT,
    ACTIONS(86), 1,
      anon_sym_LF,
    STATE(3), 1,
      sym_header,
    STATE(30), 2,
      sym_tune,
      aux_sym_file_repeat2,
    STATE(24), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [296] = 1,
    ACTIONS(88), 8,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_PERCENT,
  [307] = 1,
    ACTIONS(90), 8,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_PERCENT,
  [318] = 1,
    ACTIONS(92), 8,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_PERCENT,
  [329] = 1,
    ACTIONS(94), 8,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_PERCENT,
  [340] = 1,
    ACTIONS(96), 8,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_PERCENT,
  [351] = 1,
    ACTIONS(98), 8,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_PERCENT,
  [362] = 1,
    ACTIONS(100), 8,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_PERCENT,
  [373] = 1,
    ACTIONS(102), 6,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_PERCENT,
  [382] = 1,
    ACTIONS(69), 6,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_PERCENT,
  [391] = 4,
    ACTIONS(104), 1,
      anon_sym_LF,
    ACTIONS(107), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(109), 1,
      anon_sym_PERCENT,
    STATE(24), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [406] = 4,
    ACTIONS(112), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(114), 1,
      sym_embellishment,
    ACTIONS(117), 1,
      sym_pitch,
    STATE(25), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
  [420] = 5,
    ACTIONS(120), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(122), 1,
      aux_sym_field_label_token1,
    STATE(29), 1,
      aux_sym_header_repeat1,
    STATE(40), 1,
      sym_field_label,
    STATE(52), 1,
      sym_field,
  [436] = 4,
    ACTIONS(124), 1,
      ts_builtin_sym_end,
    ACTIONS(126), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(3), 1,
      sym_header,
    STATE(27), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [450] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(129), 1,
      ts_builtin_sym_end,
    STATE(3), 1,
      sym_header,
    STATE(27), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [464] = 5,
    ACTIONS(131), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(133), 1,
      aux_sym_field_label_token1,
    STATE(29), 1,
      aux_sym_header_repeat1,
    STATE(40), 1,
      sym_field_label,
    STATE(52), 1,
      sym_field,
  [480] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(136), 1,
      ts_builtin_sym_end,
    STATE(3), 1,
      sym_header,
    STATE(27), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [494] = 5,
    ACTIONS(122), 1,
      aux_sym_field_label_token1,
    ACTIONS(138), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(26), 1,
      aux_sym_header_repeat1,
    STATE(40), 1,
      sym_field_label,
    STATE(52), 1,
      sym_field,
  [510] = 4,
    ACTIONS(140), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(142), 1,
      sym_embellishment,
    ACTIONS(144), 1,
      sym_pitch,
    STATE(25), 2,
      sym_note,
      aux_sym_note_cluster_repeat1,
  [524] = 4,
    ACTIONS(146), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(150), 1,
      sym_duration,
    ACTIONS(152), 1,
      sym_tie,
    ACTIONS(148), 2,
      sym_embellishment,
      sym_pitch,
  [538] = 4,
    ACTIONS(154), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(158), 1,
      sym_duration,
    ACTIONS(160), 1,
      sym_tie,
    ACTIONS(156), 2,
      sym_embellishment,
      sym_pitch,
  [552] = 3,
    ACTIONS(162), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(166), 1,
      sym_tie,
    ACTIONS(164), 2,
      sym_embellishment,
      sym_pitch,
  [563] = 3,
    ACTIONS(146), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(152), 1,
      sym_tie,
    ACTIONS(148), 2,
      sym_embellishment,
      sym_pitch,
  [574] = 1,
    ACTIONS(168), 4,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
  [581] = 1,
    ACTIONS(170), 4,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
  [588] = 1,
    ACTIONS(172), 3,
      anon_sym_LF,
      anon_sym_RPAREN,
      anon_sym_COLON,
  [594] = 2,
    ACTIONS(176), 1,
      anon_sym_COLON,
    ACTIONS(174), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [602] = 3,
    ACTIONS(122), 1,
      aux_sym_field_label_token1,
    STATE(40), 1,
      sym_field_label,
    STATE(55), 1,
      sym_field,
  [612] = 2,
    ACTIONS(146), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(148), 2,
      sym_embellishment,
      sym_pitch,
  [620] = 2,
    ACTIONS(162), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(164), 2,
      sym_embellishment,
      sym_pitch,
  [628] = 2,
    ACTIONS(178), 1,
      aux_sym_note_cluster_token1,
    ACTIONS(180), 2,
      sym_embellishment,
      sym_pitch,
  [636] = 2,
    ACTIONS(131), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(182), 1,
      aux_sym_field_label_token1,
  [643] = 1,
    ACTIONS(184), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [648] = 1,
    ACTIONS(186), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [653] = 2,
    ACTIONS(188), 1,
      aux_sym_field_label_token1,
    STATE(47), 1,
      sym_field_value,
  [660] = 1,
    ACTIONS(190), 1,
      aux_sym_comment_token1,
  [664] = 1,
    ACTIONS(53), 1,
      anon_sym_LF,
  [668] = 1,
    ACTIONS(192), 1,
      anon_sym_LF,
  [672] = 1,
    ACTIONS(194), 1,
      anon_sym_LF,
  [676] = 1,
    ACTIONS(196), 1,
      sym_pitch,
  [680] = 1,
    ACTIONS(51), 1,
      anon_sym_LF,
  [684] = 1,
    ACTIONS(198), 1,
      anon_sym_RPAREN,
  [688] = 1,
    ACTIONS(200), 1,
      anon_sym_LF,
  [692] = 1,
    ACTIONS(202), 1,
      ts_builtin_sym_end,
  [696] = 1,
    ACTIONS(204), 1,
      anon_sym_LF,
  [700] = 1,
    ACTIONS(206), 1,
      aux_sym_comment_token1,
};

static const uint32_t ts_small_parse_table_map[] = {
  [SMALL_STATE(5)] = 0,
  [SMALL_STATE(6)] = 36,
  [SMALL_STATE(7)] = 72,
  [SMALL_STATE(8)] = 108,
  [SMALL_STATE(9)] = 139,
  [SMALL_STATE(10)] = 170,
  [SMALL_STATE(11)] = 201,
  [SMALL_STATE(12)] = 228,
  [SMALL_STATE(13)] = 251,
  [SMALL_STATE(14)] = 274,
  [SMALL_STATE(15)] = 296,
  [SMALL_STATE(16)] = 307,
  [SMALL_STATE(17)] = 318,
  [SMALL_STATE(18)] = 329,
  [SMALL_STATE(19)] = 340,
  [SMALL_STATE(20)] = 351,
  [SMALL_STATE(21)] = 362,
  [SMALL_STATE(22)] = 373,
  [SMALL_STATE(23)] = 382,
  [SMALL_STATE(24)] = 391,
  [SMALL_STATE(25)] = 406,
  [SMALL_STATE(26)] = 420,
  [SMALL_STATE(27)] = 436,
  [SMALL_STATE(28)] = 450,
  [SMALL_STATE(29)] = 464,
  [SMALL_STATE(30)] = 480,
  [SMALL_STATE(31)] = 494,
  [SMALL_STATE(32)] = 510,
  [SMALL_STATE(33)] = 524,
  [SMALL_STATE(34)] = 538,
  [SMALL_STATE(35)] = 552,
  [SMALL_STATE(36)] = 563,
  [SMALL_STATE(37)] = 574,
  [SMALL_STATE(38)] = 581,
  [SMALL_STATE(39)] = 588,
  [SMALL_STATE(40)] = 594,
  [SMALL_STATE(41)] = 602,
  [SMALL_STATE(42)] = 612,
  [SMALL_STATE(43)] = 620,
  [SMALL_STATE(44)] = 628,
  [SMALL_STATE(45)] = 636,
  [SMALL_STATE(46)] = 643,
  [SMALL_STATE(47)] = 648,
  [SMALL_STATE(48)] = 653,
  [SMALL_STATE(49)] = 660,
  [SMALL_STATE(50)] = 664,
  [SMALL_STATE(51)] = 668,
  [SMALL_STATE(52)] = 672,
  [SMALL_STATE(53)] = 676,
  [SMALL_STATE(54)] = 680,
  [SMALL_STATE(55)] = 684,
  [SMALL_STATE(56)] = 688,
  [SMALL_STATE(57)] = 692,
  [SMALL_STATE(58)] = 696,
  [SMALL_STATE(59)] = 700,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, SHIFT(14),
  [5] = {.entry = {.count = 1, .reusable = true}}, SHIFT(31),
  [7] = {.entry = {.count = 1, .reusable = true}}, SHIFT(59),
  [9] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 2),
  [11] = {.entry = {.count = 1, .reusable = true}}, SHIFT(4),
  [13] = {.entry = {.count = 1, .reusable = true}}, SHIFT(41),
  [15] = {.entry = {.count = 1, .reusable = true}}, SHIFT(10),
  [17] = {.entry = {.count = 1, .reusable = true}}, SHIFT(53),
  [19] = {.entry = {.count = 1, .reusable = true}}, SHIFT(34),
  [21] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 1),
  [23] = {.entry = {.count = 1, .reusable = true}}, SHIFT(2),
  [25] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym__body, 2),
  [27] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(4),
  [30] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(41),
  [33] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(10),
  [36] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(53),
  [39] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(34),
  [42] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(59),
  [45] = {.entry = {.count = 1, .reusable = true}}, SHIFT(17),
  [47] = {.entry = {.count = 1, .reusable = true}}, SHIFT(23),
  [49] = {.entry = {.count = 1, .reusable = true}}, SHIFT(49),
  [51] = {.entry = {.count = 1, .reusable = true}}, SHIFT(20),
  [53] = {.entry = {.count = 1, .reusable = true}}, SHIFT(19),
  [55] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2),
  [57] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(41),
  [60] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(23),
  [63] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(53),
  [66] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_line_repeat1, 2), SHIFT_REPEAT(34),
  [69] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_measure, 1),
  [71] = {.entry = {.count = 1, .reusable = true}}, SHIFT(9),
  [73] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(41),
  [76] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2),
  [78] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(53),
  [81] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_measure_repeat1, 2), SHIFT_REPEAT(34),
  [84] = {.entry = {.count = 1, .reusable = true}}, SHIFT(22),
  [86] = {.entry = {.count = 1, .reusable = true}}, SHIFT(24),
  [88] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 2),
  [90] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment, 3),
  [92] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 2),
  [94] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 5),
  [96] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 3),
  [98] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_line, 4),
  [100] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 3),
  [102] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_measure, 2),
  [104] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(24),
  [107] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2),
  [109] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(59),
  [112] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_note_cluster_repeat1, 2),
  [114] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(53),
  [117] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_note_cluster_repeat1, 2), SHIFT_REPEAT(34),
  [120] = {.entry = {.count = 1, .reusable = false}}, SHIFT(21),
  [122] = {.entry = {.count = 1, .reusable = true}}, SHIFT(39),
  [124] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2),
  [126] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2), SHIFT_REPEAT(31),
  [129] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 1),
  [131] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_header_repeat1, 2),
  [133] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2), SHIFT_REPEAT(39),
  [136] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 2),
  [138] = {.entry = {.count = 1, .reusable = false}}, SHIFT(15),
  [140] = {.entry = {.count = 1, .reusable = true}}, SHIFT(38),
  [142] = {.entry = {.count = 1, .reusable = false}}, SHIFT(53),
  [144] = {.entry = {.count = 1, .reusable = false}}, SHIFT(34),
  [146] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2),
  [148] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2),
  [150] = {.entry = {.count = 1, .reusable = false}}, SHIFT(35),
  [152] = {.entry = {.count = 1, .reusable = false}}, SHIFT(43),
  [154] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 1),
  [156] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 1),
  [158] = {.entry = {.count = 1, .reusable = false}}, SHIFT(36),
  [160] = {.entry = {.count = 1, .reusable = false}}, SHIFT(42),
  [162] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 3),
  [164] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 3),
  [166] = {.entry = {.count = 1, .reusable = false}}, SHIFT(44),
  [168] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__inline_field, 3),
  [170] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note_cluster, 2),
  [172] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field_label, 1),
  [174] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 1),
  [176] = {.entry = {.count = 1, .reusable = true}}, SHIFT(48),
  [178] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 4),
  [180] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 4),
  [182] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2),
  [184] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field_value, 1),
  [186] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 3),
  [188] = {.entry = {.count = 1, .reusable = true}}, SHIFT(46),
  [190] = {.entry = {.count = 1, .reusable = true}}, SHIFT(56),
  [192] = {.entry = {.count = 1, .reusable = true}}, SHIFT(16),
  [194] = {.entry = {.count = 1, .reusable = true}}, SHIFT(45),
  [196] = {.entry = {.count = 1, .reusable = true}}, SHIFT(33),
  [198] = {.entry = {.count = 1, .reusable = true}}, SHIFT(37),
  [200] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tail_comment, 2),
  [202] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
  [204] = {.entry = {.count = 1, .reusable = true}}, SHIFT(18),
  [206] = {.entry = {.count = 1, .reusable = true}}, SHIFT(51),
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
