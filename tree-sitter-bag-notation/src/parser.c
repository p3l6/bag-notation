#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 14
#define STATE_COUNT 61
#define LARGE_STATE_COUNT 5
#define SYMBOL_COUNT 38
#define ALIAS_COUNT 0
#define TOKEN_COUNT 15
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 0
#define MAX_ALIAS_SEQUENCE_LENGTH 5
#define PRODUCTION_ID_COUNT 2

enum {
  anon_sym_LF = 1,
  anon_sym_DASH_DASH_DASH_LF = 2,
  anon_sym_LPAREN = 3,
  anon_sym_RPAREN = 4,
  anon_sym_COLON = 5,
  aux_sym_field_label_token1 = 6,
  sym_barline = 7,
  aux_sym_cluster_token1 = 8,
  sym_embellishment = 9,
  sym_pitch = 10,
  sym_duration = 11,
  sym_connector = 12,
  anon_sym_PERCENT = 13,
  aux_sym_comment_token1 = 14,
  sym_file = 15,
  sym_tune = 16,
  aux_sym__body = 17,
  sym_voice = 18,
  sym_header = 19,
  sym__header_field = 20,
  sym_field = 21,
  sym__field_parts = 22,
  sym_field_label = 23,
  sym_field_value = 24,
  sym_bar = 25,
  sym__bar_content = 26,
  sym_cluster = 27,
  sym_note = 28,
  sym__blank_line = 29,
  sym_comment = 30,
  sym_tail_comment = 31,
  aux_sym_file_repeat1 = 32,
  aux_sym_file_repeat2 = 33,
  aux_sym_voice_repeat1 = 34,
  aux_sym_header_repeat1 = 35,
  aux_sym_bar_repeat1 = 36,
  aux_sym_cluster_repeat1 = 37,
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
  [aux_sym_cluster_token1] = "cluster_token1",
  [sym_embellishment] = "embellishment",
  [sym_pitch] = "pitch",
  [sym_duration] = "duration",
  [sym_connector] = "connector",
  [anon_sym_PERCENT] = "%",
  [aux_sym_comment_token1] = "comment_token1",
  [sym_file] = "file",
  [sym_tune] = "tune",
  [aux_sym__body] = "_body",
  [sym_voice] = "voice",
  [sym_header] = "header",
  [sym__header_field] = "_header_field",
  [sym_field] = "field",
  [sym__field_parts] = "_field_parts",
  [sym_field_label] = "field_label",
  [sym_field_value] = "field_value",
  [sym_bar] = "bar",
  [sym__bar_content] = "_bar_content",
  [sym_cluster] = "cluster",
  [sym_note] = "note",
  [sym__blank_line] = "_blank_line",
  [sym_comment] = "comment",
  [sym_tail_comment] = "tail_comment",
  [aux_sym_file_repeat1] = "file_repeat1",
  [aux_sym_file_repeat2] = "file_repeat2",
  [aux_sym_voice_repeat1] = "voice_repeat1",
  [aux_sym_header_repeat1] = "header_repeat1",
  [aux_sym_bar_repeat1] = "bar_repeat1",
  [aux_sym_cluster_repeat1] = "cluster_repeat1",
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
  [aux_sym_cluster_token1] = aux_sym_cluster_token1,
  [sym_embellishment] = sym_embellishment,
  [sym_pitch] = sym_pitch,
  [sym_duration] = sym_duration,
  [sym_connector] = sym_connector,
  [anon_sym_PERCENT] = anon_sym_PERCENT,
  [aux_sym_comment_token1] = aux_sym_comment_token1,
  [sym_file] = sym_file,
  [sym_tune] = sym_tune,
  [aux_sym__body] = aux_sym__body,
  [sym_voice] = sym_voice,
  [sym_header] = sym_header,
  [sym__header_field] = sym__header_field,
  [sym_field] = sym_field,
  [sym__field_parts] = sym__field_parts,
  [sym_field_label] = sym_field_label,
  [sym_field_value] = sym_field_value,
  [sym_bar] = sym_bar,
  [sym__bar_content] = sym__bar_content,
  [sym_cluster] = sym_cluster,
  [sym_note] = sym_note,
  [sym__blank_line] = sym__blank_line,
  [sym_comment] = sym_comment,
  [sym_tail_comment] = sym_tail_comment,
  [aux_sym_file_repeat1] = aux_sym_file_repeat1,
  [aux_sym_file_repeat2] = aux_sym_file_repeat2,
  [aux_sym_voice_repeat1] = aux_sym_voice_repeat1,
  [aux_sym_header_repeat1] = aux_sym_header_repeat1,
  [aux_sym_bar_repeat1] = aux_sym_bar_repeat1,
  [aux_sym_cluster_repeat1] = aux_sym_cluster_repeat1,
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
  [aux_sym_cluster_token1] = {
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
  [sym_connector] = {
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
  [sym_voice] = {
    .visible = true,
    .named = true,
  },
  [sym_header] = {
    .visible = true,
    .named = true,
  },
  [sym__header_field] = {
    .visible = false,
    .named = true,
  },
  [sym_field] = {
    .visible = true,
    .named = true,
  },
  [sym__field_parts] = {
    .visible = false,
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
  [sym_bar] = {
    .visible = true,
    .named = true,
  },
  [sym__bar_content] = {
    .visible = false,
    .named = true,
  },
  [sym_cluster] = {
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
  [aux_sym_voice_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_header_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_bar_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_cluster_repeat1] = {
    .visible = false,
    .named = false,
  },
};

static const TSSymbol ts_alias_sequences[PRODUCTION_ID_COUNT][MAX_ALIAS_SEQUENCE_LENGTH] = {
  [0] = {0},
  [1] = {
    [0] = sym_field,
  },
};

static const uint16_t ts_non_terminal_alias_map[] = {
  sym__field_parts, 2,
    sym__field_parts,
    sym_field,
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
      ACCEPT_TOKEN(aux_sym_cluster_token1);
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
      ACCEPT_TOKEN(sym_connector);
      END_STATE();
    case 25:
      ACCEPT_TOKEN(sym_connector);
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
  [23] = {.lex_state = 1},
  [24] = {.lex_state = 8},
  [25] = {.lex_state = 1},
  [26] = {.lex_state = 1},
  [27] = {.lex_state = 8},
  [28] = {.lex_state = 7},
  [29] = {.lex_state = 8},
  [30] = {.lex_state = 8},
  [31] = {.lex_state = 7},
  [32] = {.lex_state = 7},
  [33] = {.lex_state = 7},
  [34] = {.lex_state = 8},
  [35] = {.lex_state = 8},
  [36] = {.lex_state = 8},
  [37] = {.lex_state = 7},
  [38] = {.lex_state = 7},
  [39] = {.lex_state = 7},
  [40] = {.lex_state = 1},
  [41] = {.lex_state = 2},
  [42] = {.lex_state = 2},
  [43] = {.lex_state = 7},
  [44] = {.lex_state = 7},
  [45] = {.lex_state = 0},
  [46] = {.lex_state = 1},
  [47] = {.lex_state = 1},
  [48] = {.lex_state = 0},
  [49] = {.lex_state = 0},
  [50] = {.lex_state = 0},
  [51] = {.lex_state = 0},
  [52] = {.lex_state = 0},
  [53] = {.lex_state = 0},
  [54] = {.lex_state = 0},
  [55] = {.lex_state = 27},
  [56] = {.lex_state = 0},
  [57] = {.lex_state = 0},
  [58] = {.lex_state = 0},
  [59] = {.lex_state = 0},
  [60] = {.lex_state = 27},
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
    [sym_connector] = ACTIONS(1),
    [anon_sym_PERCENT] = ACTIONS(1),
  },
  [1] = {
    [sym_file] = STATE(57),
    [sym_tune] = STATE(34),
    [sym_header] = STATE(2),
    [sym__blank_line] = STATE(14),
    [sym_comment] = STATE(14),
    [aux_sym_file_repeat1] = STATE(14),
    [aux_sym_file_repeat2] = STATE(34),
    [anon_sym_LF] = ACTIONS(3),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(5),
    [anon_sym_PERCENT] = ACTIONS(7),
  },
  [2] = {
    [aux_sym__body] = STATE(4),
    [sym_voice] = STATE(4),
    [sym_field] = STATE(11),
    [sym_bar] = STATE(7),
    [sym__bar_content] = STATE(12),
    [sym_cluster] = STATE(12),
    [sym_note] = STATE(28),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_voice_repeat1] = STATE(7),
    [aux_sym_bar_repeat1] = STATE(12),
    [aux_sym_cluster_repeat1] = STATE(28),
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
    [aux_sym__body] = STATE(3),
    [sym_voice] = STATE(3),
    [sym_field] = STATE(11),
    [sym_bar] = STATE(7),
    [sym__bar_content] = STATE(12),
    [sym_cluster] = STATE(12),
    [sym_note] = STATE(28),
    [sym__blank_line] = STATE(3),
    [sym_comment] = STATE(3),
    [aux_sym_voice_repeat1] = STATE(7),
    [aux_sym_bar_repeat1] = STATE(12),
    [aux_sym_cluster_repeat1] = STATE(28),
    [ts_builtin_sym_end] = ACTIONS(21),
    [anon_sym_LF] = ACTIONS(23),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(21),
    [anon_sym_LPAREN] = ACTIONS(26),
    [sym_barline] = ACTIONS(29),
    [sym_embellishment] = ACTIONS(32),
    [sym_pitch] = ACTIONS(35),
    [anon_sym_PERCENT] = ACTIONS(38),
  },
  [4] = {
    [aux_sym__body] = STATE(3),
    [sym_voice] = STATE(3),
    [sym_field] = STATE(11),
    [sym_bar] = STATE(7),
    [sym__bar_content] = STATE(12),
    [sym_cluster] = STATE(12),
    [sym_note] = STATE(28),
    [sym__blank_line] = STATE(3),
    [sym_comment] = STATE(3),
    [aux_sym_voice_repeat1] = STATE(7),
    [aux_sym_bar_repeat1] = STATE(12),
    [aux_sym_cluster_repeat1] = STATE(28),
    [ts_builtin_sym_end] = ACTIONS(41),
    [anon_sym_LF] = ACTIONS(43),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(41),
    [anon_sym_LPAREN] = ACTIONS(13),
    [sym_barline] = ACTIONS(15),
    [sym_embellishment] = ACTIONS(17),
    [sym_pitch] = ACTIONS(19),
    [anon_sym_PERCENT] = ACTIONS(7),
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
    STATE(59), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(28), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
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
    STATE(52), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(28), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
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
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(28), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
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
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(28), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
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
    STATE(5), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(28), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
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
    STATE(6), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(28), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [201] = 7,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      sym_pitch,
    ACTIONS(71), 1,
      sym_barline,
    STATE(6), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(28), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [228] = 6,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(17), 1,
      sym_embellishment,
    ACTIONS(19), 1,
      sym_pitch,
    ACTIONS(73), 1,
      sym_barline,
    STATE(28), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(13), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [251] = 6,
    ACTIONS(75), 1,
      anon_sym_LPAREN,
    ACTIONS(78), 1,
      sym_barline,
    ACTIONS(80), 1,
      sym_embellishment,
    ACTIONS(83), 1,
      sym_pitch,
    STATE(28), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(13), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [274] = 6,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(7), 1,
      anon_sym_PERCENT,
    ACTIONS(86), 1,
      anon_sym_LF,
    STATE(2), 1,
      sym_header,
    STATE(29), 2,
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
  [382] = 6,
    ACTIONS(104), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(106), 1,
      aux_sym_field_label_token1,
    STATE(25), 1,
      aux_sym_header_repeat1,
    STATE(41), 1,
      sym_field_label,
    STATE(51), 1,
      sym__header_field,
    STATE(53), 1,
      sym__field_parts,
  [401] = 4,
    ACTIONS(108), 1,
      anon_sym_LF,
    ACTIONS(111), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(113), 1,
      anon_sym_PERCENT,
    STATE(24), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [416] = 6,
    ACTIONS(116), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(118), 1,
      aux_sym_field_label_token1,
    STATE(25), 1,
      aux_sym_header_repeat1,
    STATE(41), 1,
      sym_field_label,
    STATE(51), 1,
      sym__header_field,
    STATE(53), 1,
      sym__field_parts,
  [435] = 6,
    ACTIONS(106), 1,
      aux_sym_field_label_token1,
    ACTIONS(121), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(23), 1,
      aux_sym_header_repeat1,
    STATE(41), 1,
      sym_field_label,
    STATE(51), 1,
      sym__header_field,
    STATE(53), 1,
      sym__field_parts,
  [454] = 1,
    ACTIONS(69), 6,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_PERCENT,
  [463] = 4,
    ACTIONS(123), 1,
      aux_sym_cluster_token1,
    ACTIONS(125), 1,
      sym_embellishment,
    ACTIONS(127), 1,
      sym_pitch,
    STATE(31), 2,
      sym_note,
      aux_sym_cluster_repeat1,
  [477] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(129), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(30), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [491] = 4,
    ACTIONS(131), 1,
      ts_builtin_sym_end,
    ACTIONS(133), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(2), 1,
      sym_header,
    STATE(30), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [505] = 4,
    ACTIONS(136), 1,
      aux_sym_cluster_token1,
    ACTIONS(138), 1,
      sym_embellishment,
    ACTIONS(141), 1,
      sym_pitch,
    STATE(31), 2,
      sym_note,
      aux_sym_cluster_repeat1,
  [519] = 4,
    ACTIONS(144), 1,
      aux_sym_cluster_token1,
    ACTIONS(148), 1,
      sym_duration,
    ACTIONS(150), 1,
      sym_connector,
    ACTIONS(146), 2,
      sym_embellishment,
      sym_pitch,
  [533] = 4,
    ACTIONS(152), 1,
      aux_sym_cluster_token1,
    ACTIONS(156), 1,
      sym_duration,
    ACTIONS(158), 1,
      sym_connector,
    ACTIONS(154), 2,
      sym_embellishment,
      sym_pitch,
  [547] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(160), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(30), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [561] = 1,
    ACTIONS(162), 4,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
  [568] = 1,
    ACTIONS(164), 4,
      anon_sym_LPAREN,
      sym_barline,
      sym_embellishment,
      sym_pitch,
  [575] = 3,
    ACTIONS(152), 1,
      aux_sym_cluster_token1,
    ACTIONS(158), 1,
      sym_connector,
    ACTIONS(154), 2,
      sym_embellishment,
      sym_pitch,
  [586] = 3,
    ACTIONS(166), 1,
      aux_sym_cluster_token1,
    ACTIONS(170), 1,
      sym_connector,
    ACTIONS(168), 2,
      sym_embellishment,
      sym_pitch,
  [597] = 2,
    ACTIONS(166), 1,
      aux_sym_cluster_token1,
    ACTIONS(168), 2,
      sym_embellishment,
      sym_pitch,
  [605] = 3,
    ACTIONS(106), 1,
      aux_sym_field_label_token1,
    STATE(41), 1,
      sym_field_label,
    STATE(49), 1,
      sym__field_parts,
  [615] = 2,
    ACTIONS(174), 1,
      anon_sym_COLON,
    ACTIONS(172), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [623] = 1,
    ACTIONS(176), 3,
      anon_sym_LF,
      anon_sym_RPAREN,
      anon_sym_COLON,
  [629] = 2,
    ACTIONS(152), 1,
      aux_sym_cluster_token1,
    ACTIONS(154), 2,
      sym_embellishment,
      sym_pitch,
  [637] = 2,
    ACTIONS(178), 1,
      aux_sym_cluster_token1,
    ACTIONS(180), 2,
      sym_embellishment,
      sym_pitch,
  [645] = 1,
    ACTIONS(182), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [650] = 2,
    ACTIONS(116), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(184), 1,
      aux_sym_field_label_token1,
  [657] = 2,
    ACTIONS(186), 1,
      aux_sym_field_label_token1,
    STATE(45), 1,
      sym_field_value,
  [664] = 1,
    ACTIONS(188), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [669] = 1,
    ACTIONS(190), 1,
      anon_sym_RPAREN,
  [673] = 1,
    ACTIONS(192), 1,
      sym_pitch,
  [677] = 1,
    ACTIONS(194), 1,
      anon_sym_LF,
  [681] = 1,
    ACTIONS(45), 1,
      anon_sym_LF,
  [685] = 1,
    ACTIONS(196), 1,
      anon_sym_LF,
  [689] = 1,
    ACTIONS(51), 1,
      anon_sym_LF,
  [693] = 1,
    ACTIONS(198), 1,
      aux_sym_comment_token1,
  [697] = 1,
    ACTIONS(200), 1,
      anon_sym_LF,
  [701] = 1,
    ACTIONS(202), 1,
      ts_builtin_sym_end,
  [705] = 1,
    ACTIONS(204), 1,
      anon_sym_LF,
  [709] = 1,
    ACTIONS(206), 1,
      anon_sym_LF,
  [713] = 1,
    ACTIONS(208), 1,
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
  [SMALL_STATE(24)] = 401,
  [SMALL_STATE(25)] = 416,
  [SMALL_STATE(26)] = 435,
  [SMALL_STATE(27)] = 454,
  [SMALL_STATE(28)] = 463,
  [SMALL_STATE(29)] = 477,
  [SMALL_STATE(30)] = 491,
  [SMALL_STATE(31)] = 505,
  [SMALL_STATE(32)] = 519,
  [SMALL_STATE(33)] = 533,
  [SMALL_STATE(34)] = 547,
  [SMALL_STATE(35)] = 561,
  [SMALL_STATE(36)] = 568,
  [SMALL_STATE(37)] = 575,
  [SMALL_STATE(38)] = 586,
  [SMALL_STATE(39)] = 597,
  [SMALL_STATE(40)] = 605,
  [SMALL_STATE(41)] = 615,
  [SMALL_STATE(42)] = 623,
  [SMALL_STATE(43)] = 629,
  [SMALL_STATE(44)] = 637,
  [SMALL_STATE(45)] = 645,
  [SMALL_STATE(46)] = 650,
  [SMALL_STATE(47)] = 657,
  [SMALL_STATE(48)] = 664,
  [SMALL_STATE(49)] = 669,
  [SMALL_STATE(50)] = 673,
  [SMALL_STATE(51)] = 677,
  [SMALL_STATE(52)] = 681,
  [SMALL_STATE(53)] = 685,
  [SMALL_STATE(54)] = 689,
  [SMALL_STATE(55)] = 693,
  [SMALL_STATE(56)] = 697,
  [SMALL_STATE(57)] = 701,
  [SMALL_STATE(58)] = 705,
  [SMALL_STATE(59)] = 709,
  [SMALL_STATE(60)] = 713,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, SHIFT(14),
  [5] = {.entry = {.count = 1, .reusable = true}}, SHIFT(26),
  [7] = {.entry = {.count = 1, .reusable = true}}, SHIFT(60),
  [9] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 1),
  [11] = {.entry = {.count = 1, .reusable = true}}, SHIFT(4),
  [13] = {.entry = {.count = 1, .reusable = true}}, SHIFT(40),
  [15] = {.entry = {.count = 1, .reusable = true}}, SHIFT(10),
  [17] = {.entry = {.count = 1, .reusable = true}}, SHIFT(50),
  [19] = {.entry = {.count = 1, .reusable = true}}, SHIFT(32),
  [21] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym__body, 2),
  [23] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(3),
  [26] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(40),
  [29] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(10),
  [32] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(50),
  [35] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(32),
  [38] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(60),
  [41] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 2),
  [43] = {.entry = {.count = 1, .reusable = true}}, SHIFT(3),
  [45] = {.entry = {.count = 1, .reusable = true}}, SHIFT(15),
  [47] = {.entry = {.count = 1, .reusable = true}}, SHIFT(27),
  [49] = {.entry = {.count = 1, .reusable = true}}, SHIFT(55),
  [51] = {.entry = {.count = 1, .reusable = true}}, SHIFT(16),
  [53] = {.entry = {.count = 1, .reusable = true}}, SHIFT(19),
  [55] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2),
  [57] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(40),
  [60] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(27),
  [63] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(50),
  [66] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(32),
  [69] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_bar, 1),
  [71] = {.entry = {.count = 1, .reusable = true}}, SHIFT(9),
  [73] = {.entry = {.count = 1, .reusable = true}}, SHIFT(22),
  [75] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(40),
  [78] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2),
  [80] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(50),
  [83] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(32),
  [86] = {.entry = {.count = 1, .reusable = true}}, SHIFT(24),
  [88] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 4),
  [90] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 3),
  [92] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 2),
  [94] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 5),
  [96] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 2),
  [98] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment, 3),
  [100] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 3),
  [102] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_bar, 2),
  [104] = {.entry = {.count = 1, .reusable = false}}, SHIFT(21),
  [106] = {.entry = {.count = 1, .reusable = true}}, SHIFT(42),
  [108] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(24),
  [111] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2),
  [113] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(60),
  [116] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_header_repeat1, 2),
  [118] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2), SHIFT_REPEAT(42),
  [121] = {.entry = {.count = 1, .reusable = false}}, SHIFT(17),
  [123] = {.entry = {.count = 1, .reusable = true}}, SHIFT(35),
  [125] = {.entry = {.count = 1, .reusable = false}}, SHIFT(50),
  [127] = {.entry = {.count = 1, .reusable = false}}, SHIFT(32),
  [129] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 2),
  [131] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2),
  [133] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2), SHIFT_REPEAT(26),
  [136] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_cluster_repeat1, 2),
  [138] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_cluster_repeat1, 2), SHIFT_REPEAT(50),
  [141] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_cluster_repeat1, 2), SHIFT_REPEAT(32),
  [144] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 1),
  [146] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 1),
  [148] = {.entry = {.count = 1, .reusable = false}}, SHIFT(37),
  [150] = {.entry = {.count = 1, .reusable = false}}, SHIFT(43),
  [152] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2),
  [154] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2),
  [156] = {.entry = {.count = 1, .reusable = false}}, SHIFT(38),
  [158] = {.entry = {.count = 1, .reusable = false}}, SHIFT(39),
  [160] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 1),
  [162] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_cluster, 2),
  [164] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 3),
  [166] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 3),
  [168] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 3),
  [170] = {.entry = {.count = 1, .reusable = false}}, SHIFT(44),
  [172] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__field_parts, 1),
  [174] = {.entry = {.count = 1, .reusable = true}}, SHIFT(47),
  [176] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field_label, 1),
  [178] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 4),
  [180] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 4),
  [182] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__field_parts, 3),
  [184] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2),
  [186] = {.entry = {.count = 1, .reusable = true}}, SHIFT(48),
  [188] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field_value, 1),
  [190] = {.entry = {.count = 1, .reusable = true}}, SHIFT(36),
  [192] = {.entry = {.count = 1, .reusable = true}}, SHIFT(33),
  [194] = {.entry = {.count = 1, .reusable = true}}, SHIFT(46),
  [196] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__header_field, 1, .production_id = 1),
  [198] = {.entry = {.count = 1, .reusable = true}}, SHIFT(56),
  [200] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tail_comment, 2),
  [202] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
  [204] = {.entry = {.count = 1, .reusable = true}}, SHIFT(20),
  [206] = {.entry = {.count = 1, .reusable = true}}, SHIFT(18),
  [208] = {.entry = {.count = 1, .reusable = true}}, SHIFT(58),
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
