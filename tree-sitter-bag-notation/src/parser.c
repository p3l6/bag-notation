#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 14
#define STATE_COUNT 65
#define LARGE_STATE_COUNT 5
#define SYMBOL_COUNT 38
#define ALIAS_COUNT 0
#define TOKEN_COUNT 17
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 0
#define MAX_ALIAS_SEQUENCE_LENGTH 5
#define PRODUCTION_ID_COUNT 2

enum {
  anon_sym_LF = 1,
  anon_sym_DASH_DASH_DASH_LF = 2,
  anon_sym_LPAREN = 3,
  anon_sym_RPAREN = 4,
  sym_shorthand_label = 5,
  anon_sym_COLON = 6,
  sym_field_label = 7,
  sym_field_value = 8,
  sym_barline = 9,
  aux_sym_cluster_token1 = 10,
  sym_embellishment = 11,
  sym_pitch = 12,
  sym_duration = 13,
  sym_connector = 14,
  anon_sym_POUND = 15,
  aux_sym_comment_token1 = 16,
  sym_file = 17,
  sym_tune = 18,
  aux_sym__body = 19,
  sym_voice = 20,
  sym_header = 21,
  sym__header_field = 22,
  sym_field = 23,
  sym__field_parts = 24,
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
  [sym_shorthand_label] = "shorthand_label",
  [anon_sym_COLON] = ":",
  [sym_field_label] = "field_label",
  [sym_field_value] = "field_value",
  [sym_barline] = "barline",
  [aux_sym_cluster_token1] = "cluster_token1",
  [sym_embellishment] = "embellishment",
  [sym_pitch] = "pitch",
  [sym_duration] = "duration",
  [sym_connector] = "connector",
  [anon_sym_POUND] = "#",
  [aux_sym_comment_token1] = "comment_token1",
  [sym_file] = "file",
  [sym_tune] = "tune",
  [aux_sym__body] = "_body",
  [sym_voice] = "voice",
  [sym_header] = "header",
  [sym__header_field] = "_header_field",
  [sym_field] = "field",
  [sym__field_parts] = "_field_parts",
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
  [sym_shorthand_label] = sym_shorthand_label,
  [anon_sym_COLON] = anon_sym_COLON,
  [sym_field_label] = sym_field_label,
  [sym_field_value] = sym_field_value,
  [sym_barline] = sym_barline,
  [aux_sym_cluster_token1] = aux_sym_cluster_token1,
  [sym_embellishment] = sym_embellishment,
  [sym_pitch] = sym_pitch,
  [sym_duration] = sym_duration,
  [sym_connector] = sym_connector,
  [anon_sym_POUND] = anon_sym_POUND,
  [aux_sym_comment_token1] = aux_sym_comment_token1,
  [sym_file] = sym_file,
  [sym_tune] = sym_tune,
  [aux_sym__body] = aux_sym__body,
  [sym_voice] = sym_voice,
  [sym_header] = sym_header,
  [sym__header_field] = sym__header_field,
  [sym_field] = sym_field,
  [sym__field_parts] = sym__field_parts,
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
  [sym_shorthand_label] = {
    .visible = true,
    .named = true,
  },
  [anon_sym_COLON] = {
    .visible = true,
    .named = false,
  },
  [sym_field_label] = {
    .visible = true,
    .named = true,
  },
  [sym_field_value] = {
    .visible = true,
    .named = true,
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
  [anon_sym_POUND] = {
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
      if (lookahead == '#') ADVANCE(28);
      if (lookahead == '(') ADVANCE(12);
      if (lookahead == ')') ADVANCE(13);
      if (lookahead == '-') ADVANCE(27);
      if (lookahead == ':') ADVANCE(15);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(0)
      if (lookahead == '_' ||
          lookahead == '~') ADVANCE(26);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(25);
      if (('a' <= lookahead && lookahead <= 'h') ||
          lookahead == 'l') ADVANCE(24);
      if (lookahead == '&' ||
          lookahead == '\'' ||
          (',' <= lookahead && lookahead <= '4') ||
          lookahead == '=' ||
          lookahead == '^') ADVANCE(14);
      if (('j' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(23);
      END_STATE();
    case 1:
      if (lookahead == '\t') SKIP(1)
      if (lookahead == ' ') ADVANCE(16);
      if (lookahead == '-') ADVANCE(3);
      if (lookahead == '\'' ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(17);
      END_STATE();
    case 2:
      if (lookahead == '\n') ADVANCE(11);
      END_STATE();
    case 3:
      if (lookahead == '-') ADVANCE(4);
      END_STATE();
    case 4:
      if (lookahead == '-') ADVANCE(2);
      END_STATE();
    case 5:
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(22);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(25);
      if (lookahead == '-' ||
          lookahead == '_' ||
          lookahead == '~') ADVANCE(26);
      if (('a' <= lookahead && lookahead <= 'h') ||
          lookahead == 'l') ADVANCE(24);
      if (lookahead == '&' ||
          lookahead == '\'' ||
          (',' <= lookahead && lookahead <= '4') ||
          lookahead == '=' ||
          lookahead == '^') ADVANCE(14);
      if (('j' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(23);
      END_STATE();
    case 6:
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(18);
      if (lookahead != 0 &&
          lookahead != '\n' &&
          lookahead != ')') ADVANCE(19);
      END_STATE();
    case 7:
      if (lookahead == 'i' ||
          lookahead == '|') ADVANCE(21);
      END_STATE();
    case 8:
      if (eof) ADVANCE(9);
      if (lookahead == '\n') ADVANCE(10);
      if (lookahead == '#') ADVANCE(28);
      if (lookahead == '(') ADVANCE(12);
      if (lookahead == '-') ADVANCE(3);
      if (lookahead == ':') ADVANCE(7);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(8)
      if (lookahead == 'i' ||
          lookahead == '|') ADVANCE(21);
      if (('a' <= lookahead && lookahead <= 'h') ||
          lookahead == 'l') ADVANCE(24);
      if (lookahead == '&' ||
          lookahead == '\'' ||
          lookahead == ',' ||
          ('0' <= lookahead && lookahead <= '4') ||
          lookahead == '=' ||
          lookahead == '^') ADVANCE(14);
      if (('j' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(23);
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
      ACCEPT_TOKEN(sym_shorthand_label);
      END_STATE();
    case 15:
      ACCEPT_TOKEN(anon_sym_COLON);
      END_STATE();
    case 16:
      ACCEPT_TOKEN(sym_field_label);
      if (lookahead == ' ') ADVANCE(16);
      if (lookahead == '\'' ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(17);
      END_STATE();
    case 17:
      ACCEPT_TOKEN(sym_field_label);
      if (lookahead == ' ' ||
          lookahead == '\'' ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(17);
      END_STATE();
    case 18:
      ACCEPT_TOKEN(sym_field_value);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(18);
      if (lookahead != 0 &&
          lookahead != '\n' &&
          lookahead != ')') ADVANCE(19);
      END_STATE();
    case 19:
      ACCEPT_TOKEN(sym_field_value);
      if (lookahead != 0 &&
          lookahead != '\n' &&
          lookahead != ')') ADVANCE(19);
      END_STATE();
    case 20:
      ACCEPT_TOKEN(sym_barline);
      END_STATE();
    case 21:
      ACCEPT_TOKEN(sym_barline);
      if (lookahead == ':') ADVANCE(20);
      if (lookahead == 'i' ||
          lookahead == '|') ADVANCE(21);
      END_STATE();
    case 22:
      ACCEPT_TOKEN(aux_sym_cluster_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(22);
      END_STATE();
    case 23:
      ACCEPT_TOKEN(sym_embellishment);
      if (lookahead == 'j' ||
          lookahead == 'k' ||
          ('m' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(23);
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
      ACCEPT_TOKEN(sym_connector);
      END_STATE();
    case 27:
      ACCEPT_TOKEN(sym_connector);
      if (lookahead == '-') ADVANCE(4);
      END_STATE();
    case 28:
      ACCEPT_TOKEN(anon_sym_POUND);
      END_STATE();
    case 29:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(29);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(30);
      END_STATE();
    case 30:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(30);
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
  [24] = {.lex_state = 5},
  [25] = {.lex_state = 5},
  [26] = {.lex_state = 5},
  [27] = {.lex_state = 5},
  [28] = {.lex_state = 8},
  [29] = {.lex_state = 5},
  [30] = {.lex_state = 8},
  [31] = {.lex_state = 1},
  [32] = {.lex_state = 1},
  [33] = {.lex_state = 5},
  [34] = {.lex_state = 8},
  [35] = {.lex_state = 5},
  [36] = {.lex_state = 8},
  [37] = {.lex_state = 8},
  [38] = {.lex_state = 1},
  [39] = {.lex_state = 5},
  [40] = {.lex_state = 8},
  [41] = {.lex_state = 8},
  [42] = {.lex_state = 5},
  [43] = {.lex_state = 5},
  [44] = {.lex_state = 5},
  [45] = {.lex_state = 5},
  [46] = {.lex_state = 0},
  [47] = {.lex_state = 0},
  [48] = {.lex_state = 0},
  [49] = {.lex_state = 1},
  [50] = {.lex_state = 1},
  [51] = {.lex_state = 0},
  [52] = {.lex_state = 0},
  [53] = {.lex_state = 0},
  [54] = {.lex_state = 0},
  [55] = {.lex_state = 0},
  [56] = {.lex_state = 29},
  [57] = {.lex_state = 0},
  [58] = {.lex_state = 0},
  [59] = {.lex_state = 0},
  [60] = {.lex_state = 6},
  [61] = {.lex_state = 0},
  [62] = {.lex_state = 0},
  [63] = {.lex_state = 0},
  [64] = {.lex_state = 29},
};

static const uint16_t ts_parse_table[LARGE_STATE_COUNT][SYMBOL_COUNT] = {
  [0] = {
    [ts_builtin_sym_end] = ACTIONS(1),
    [anon_sym_LF] = ACTIONS(1),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(1),
    [anon_sym_LPAREN] = ACTIONS(1),
    [anon_sym_RPAREN] = ACTIONS(1),
    [sym_shorthand_label] = ACTIONS(1),
    [anon_sym_COLON] = ACTIONS(1),
    [sym_embellishment] = ACTIONS(1),
    [sym_pitch] = ACTIONS(1),
    [sym_duration] = ACTIONS(1),
    [sym_connector] = ACTIONS(1),
    [anon_sym_POUND] = ACTIONS(1),
  },
  [1] = {
    [sym_file] = STATE(61),
    [sym_tune] = STATE(34),
    [sym_header] = STATE(3),
    [sym__blank_line] = STATE(19),
    [sym_comment] = STATE(19),
    [aux_sym_file_repeat1] = STATE(19),
    [aux_sym_file_repeat2] = STATE(34),
    [anon_sym_LF] = ACTIONS(3),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(5),
    [anon_sym_POUND] = ACTIONS(7),
  },
  [2] = {
    [aux_sym__body] = STATE(2),
    [sym_voice] = STATE(2),
    [sym_field] = STATE(11),
    [sym_bar] = STATE(7),
    [sym__bar_content] = STATE(12),
    [sym_cluster] = STATE(12),
    [sym_note] = STATE(27),
    [sym__blank_line] = STATE(2),
    [sym_comment] = STATE(2),
    [aux_sym_voice_repeat1] = STATE(7),
    [aux_sym_bar_repeat1] = STATE(12),
    [aux_sym_cluster_repeat1] = STATE(27),
    [ts_builtin_sym_end] = ACTIONS(9),
    [anon_sym_LF] = ACTIONS(11),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(9),
    [anon_sym_LPAREN] = ACTIONS(14),
    [sym_shorthand_label] = ACTIONS(17),
    [sym_barline] = ACTIONS(20),
    [sym_embellishment] = ACTIONS(23),
    [sym_pitch] = ACTIONS(26),
    [anon_sym_POUND] = ACTIONS(29),
  },
  [3] = {
    [aux_sym__body] = STATE(4),
    [sym_voice] = STATE(4),
    [sym_field] = STATE(11),
    [sym_bar] = STATE(7),
    [sym__bar_content] = STATE(12),
    [sym_cluster] = STATE(12),
    [sym_note] = STATE(27),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_voice_repeat1] = STATE(7),
    [aux_sym_bar_repeat1] = STATE(12),
    [aux_sym_cluster_repeat1] = STATE(27),
    [ts_builtin_sym_end] = ACTIONS(32),
    [anon_sym_LF] = ACTIONS(34),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(32),
    [anon_sym_LPAREN] = ACTIONS(36),
    [sym_shorthand_label] = ACTIONS(38),
    [sym_barline] = ACTIONS(40),
    [sym_embellishment] = ACTIONS(42),
    [sym_pitch] = ACTIONS(44),
    [anon_sym_POUND] = ACTIONS(7),
  },
  [4] = {
    [aux_sym__body] = STATE(2),
    [sym_voice] = STATE(2),
    [sym_field] = STATE(11),
    [sym_bar] = STATE(7),
    [sym__bar_content] = STATE(12),
    [sym_cluster] = STATE(12),
    [sym_note] = STATE(27),
    [sym__blank_line] = STATE(2),
    [sym_comment] = STATE(2),
    [aux_sym_voice_repeat1] = STATE(7),
    [aux_sym_bar_repeat1] = STATE(12),
    [aux_sym_cluster_repeat1] = STATE(27),
    [ts_builtin_sym_end] = ACTIONS(46),
    [anon_sym_LF] = ACTIONS(48),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(46),
    [anon_sym_LPAREN] = ACTIONS(36),
    [sym_shorthand_label] = ACTIONS(38),
    [sym_barline] = ACTIONS(40),
    [sym_embellishment] = ACTIONS(42),
    [sym_pitch] = ACTIONS(44),
    [anon_sym_POUND] = ACTIONS(7),
  },
};

static const uint16_t ts_small_parse_table[] = {
  [0] = 11,
    ACTIONS(36), 1,
      anon_sym_LPAREN,
    ACTIONS(38), 1,
      sym_shorthand_label,
    ACTIONS(42), 1,
      sym_embellishment,
    ACTIONS(44), 1,
      sym_pitch,
    ACTIONS(50), 1,
      anon_sym_LF,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(54), 1,
      anon_sym_POUND,
    STATE(57), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(27), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [39] = 11,
    ACTIONS(36), 1,
      anon_sym_LPAREN,
    ACTIONS(38), 1,
      sym_shorthand_label,
    ACTIONS(42), 1,
      sym_embellishment,
    ACTIONS(44), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(54), 1,
      anon_sym_POUND,
    ACTIONS(56), 1,
      anon_sym_LF,
    STATE(62), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(27), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [78] = 11,
    ACTIONS(36), 1,
      anon_sym_LPAREN,
    ACTIONS(38), 1,
      sym_shorthand_label,
    ACTIONS(42), 1,
      sym_embellishment,
    ACTIONS(44), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(54), 1,
      anon_sym_POUND,
    ACTIONS(58), 1,
      anon_sym_LF,
    STATE(55), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(27), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [117] = 9,
    ACTIONS(62), 1,
      anon_sym_LPAREN,
    ACTIONS(65), 1,
      sym_shorthand_label,
    ACTIONS(68), 1,
      sym_barline,
    ACTIONS(71), 1,
      sym_embellishment,
    ACTIONS(74), 1,
      sym_pitch,
    ACTIONS(60), 2,
      anon_sym_LF,
      anon_sym_POUND,
    STATE(8), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(27), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [151] = 9,
    ACTIONS(36), 1,
      anon_sym_LPAREN,
    ACTIONS(38), 1,
      sym_shorthand_label,
    ACTIONS(42), 1,
      sym_embellishment,
    ACTIONS(44), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(77), 2,
      anon_sym_LF,
      anon_sym_POUND,
    STATE(5), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(27), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [185] = 9,
    ACTIONS(36), 1,
      anon_sym_LPAREN,
    ACTIONS(38), 1,
      sym_shorthand_label,
    ACTIONS(42), 1,
      sym_embellishment,
    ACTIONS(44), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(77), 2,
      anon_sym_LF,
      anon_sym_POUND,
    STATE(6), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(27), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [219] = 8,
    ACTIONS(36), 1,
      anon_sym_LPAREN,
    ACTIONS(38), 1,
      sym_shorthand_label,
    ACTIONS(42), 1,
      sym_embellishment,
    ACTIONS(44), 1,
      sym_pitch,
    ACTIONS(79), 1,
      sym_barline,
    STATE(5), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(27), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [249] = 7,
    ACTIONS(36), 1,
      anon_sym_LPAREN,
    ACTIONS(38), 1,
      sym_shorthand_label,
    ACTIONS(42), 1,
      sym_embellishment,
    ACTIONS(44), 1,
      sym_pitch,
    ACTIONS(81), 1,
      sym_barline,
    STATE(27), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(13), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [275] = 7,
    ACTIONS(83), 1,
      anon_sym_LPAREN,
    ACTIONS(86), 1,
      sym_shorthand_label,
    ACTIONS(89), 1,
      sym_barline,
    ACTIONS(91), 1,
      sym_embellishment,
    ACTIONS(94), 1,
      sym_pitch,
    STATE(27), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(13), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [301] = 1,
    ACTIONS(97), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_POUND,
  [313] = 1,
    ACTIONS(99), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_POUND,
  [325] = 1,
    ACTIONS(101), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_POUND,
  [337] = 1,
    ACTIONS(103), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_POUND,
  [349] = 1,
    ACTIONS(105), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_POUND,
  [361] = 6,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(7), 1,
      anon_sym_POUND,
    ACTIONS(107), 1,
      anon_sym_LF,
    STATE(3), 1,
      sym_header,
    STATE(37), 2,
      sym_tune,
      aux_sym_file_repeat2,
    STATE(28), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [383] = 1,
    ACTIONS(109), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_POUND,
  [395] = 1,
    ACTIONS(111), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_POUND,
  [407] = 1,
    ACTIONS(113), 7,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_POUND,
  [417] = 1,
    ACTIONS(77), 7,
      anon_sym_LF,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_POUND,
  [427] = 4,
    ACTIONS(117), 1,
      aux_sym_cluster_token1,
    ACTIONS(119), 1,
      sym_duration,
    ACTIONS(121), 1,
      sym_connector,
    ACTIONS(115), 3,
      sym_shorthand_label,
      sym_embellishment,
      sym_pitch,
  [442] = 4,
    ACTIONS(125), 1,
      aux_sym_cluster_token1,
    ACTIONS(127), 1,
      sym_duration,
    ACTIONS(129), 1,
      sym_connector,
    ACTIONS(123), 3,
      sym_shorthand_label,
      sym_embellishment,
      sym_pitch,
  [457] = 5,
    ACTIONS(131), 1,
      sym_shorthand_label,
    ACTIONS(134), 1,
      aux_sym_cluster_token1,
    ACTIONS(136), 1,
      sym_embellishment,
    ACTIONS(139), 1,
      sym_pitch,
    STATE(26), 2,
      sym_note,
      aux_sym_cluster_repeat1,
  [474] = 5,
    ACTIONS(142), 1,
      sym_shorthand_label,
    ACTIONS(144), 1,
      aux_sym_cluster_token1,
    ACTIONS(146), 1,
      sym_embellishment,
    ACTIONS(148), 1,
      sym_pitch,
    STATE(26), 2,
      sym_note,
      aux_sym_cluster_repeat1,
  [491] = 4,
    ACTIONS(150), 1,
      anon_sym_LF,
    ACTIONS(153), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(155), 1,
      anon_sym_POUND,
    STATE(28), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [506] = 4,
    ACTIONS(160), 1,
      aux_sym_cluster_token1,
    ACTIONS(162), 1,
      sym_duration,
    ACTIONS(164), 1,
      sym_connector,
    ACTIONS(158), 3,
      sym_shorthand_label,
      sym_embellishment,
      sym_pitch,
  [521] = 1,
    ACTIONS(166), 5,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
  [529] = 5,
    ACTIONS(168), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(170), 1,
      sym_field_label,
    STATE(38), 1,
      aux_sym_header_repeat1,
    STATE(52), 1,
      sym__field_parts,
    STATE(54), 1,
      sym__header_field,
  [545] = 5,
    ACTIONS(170), 1,
      sym_field_label,
    ACTIONS(172), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(31), 1,
      aux_sym_header_repeat1,
    STATE(52), 1,
      sym__field_parts,
    STATE(54), 1,
      sym__header_field,
  [561] = 3,
    ACTIONS(176), 1,
      aux_sym_cluster_token1,
    ACTIONS(178), 1,
      sym_connector,
    ACTIONS(174), 3,
      sym_shorthand_label,
      sym_embellishment,
      sym_pitch,
  [573] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(180), 1,
      ts_builtin_sym_end,
    STATE(3), 1,
      sym_header,
    STATE(36), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [587] = 3,
    ACTIONS(160), 1,
      aux_sym_cluster_token1,
    ACTIONS(164), 1,
      sym_connector,
    ACTIONS(158), 3,
      sym_shorthand_label,
      sym_embellishment,
      sym_pitch,
  [599] = 4,
    ACTIONS(182), 1,
      ts_builtin_sym_end,
    ACTIONS(184), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(3), 1,
      sym_header,
    STATE(36), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [613] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(187), 1,
      ts_builtin_sym_end,
    STATE(3), 1,
      sym_header,
    STATE(36), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [627] = 5,
    ACTIONS(189), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(191), 1,
      sym_field_label,
    STATE(38), 1,
      aux_sym_header_repeat1,
    STATE(52), 1,
      sym__field_parts,
    STATE(54), 1,
      sym__header_field,
  [643] = 3,
    ACTIONS(117), 1,
      aux_sym_cluster_token1,
    ACTIONS(121), 1,
      sym_connector,
    ACTIONS(115), 3,
      sym_shorthand_label,
      sym_embellishment,
      sym_pitch,
  [655] = 1,
    ACTIONS(194), 5,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
  [663] = 1,
    ACTIONS(196), 5,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
  [671] = 2,
    ACTIONS(200), 1,
      aux_sym_cluster_token1,
    ACTIONS(198), 3,
      sym_shorthand_label,
      sym_embellishment,
      sym_pitch,
  [680] = 2,
    ACTIONS(176), 1,
      aux_sym_cluster_token1,
    ACTIONS(174), 3,
      sym_shorthand_label,
      sym_embellishment,
      sym_pitch,
  [689] = 2,
    ACTIONS(160), 1,
      aux_sym_cluster_token1,
    ACTIONS(158), 3,
      sym_shorthand_label,
      sym_embellishment,
      sym_pitch,
  [698] = 2,
    ACTIONS(117), 1,
      aux_sym_cluster_token1,
    ACTIONS(115), 3,
      sym_shorthand_label,
      sym_embellishment,
      sym_pitch,
  [707] = 2,
    ACTIONS(204), 1,
      anon_sym_COLON,
    ACTIONS(202), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [715] = 2,
    ACTIONS(206), 1,
      sym_embellishment,
    ACTIONS(208), 1,
      sym_pitch,
  [722] = 1,
    ACTIONS(210), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [727] = 2,
    ACTIONS(170), 1,
      sym_field_label,
    STATE(51), 1,
      sym__field_parts,
  [734] = 2,
    ACTIONS(189), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(212), 1,
      sym_field_label,
  [741] = 1,
    ACTIONS(214), 1,
      anon_sym_RPAREN,
  [745] = 1,
    ACTIONS(216), 1,
      anon_sym_LF,
  [749] = 1,
    ACTIONS(218), 1,
      anon_sym_LF,
  [753] = 1,
    ACTIONS(220), 1,
      anon_sym_LF,
  [757] = 1,
    ACTIONS(50), 1,
      anon_sym_LF,
  [761] = 1,
    ACTIONS(222), 1,
      aux_sym_comment_token1,
  [765] = 1,
    ACTIONS(56), 1,
      anon_sym_LF,
  [769] = 1,
    ACTIONS(208), 1,
      sym_pitch,
  [773] = 1,
    ACTIONS(224), 1,
      anon_sym_LF,
  [777] = 1,
    ACTIONS(226), 1,
      sym_field_value,
  [781] = 1,
    ACTIONS(228), 1,
      ts_builtin_sym_end,
  [785] = 1,
    ACTIONS(230), 1,
      anon_sym_LF,
  [789] = 1,
    ACTIONS(232), 1,
      sym_pitch,
  [793] = 1,
    ACTIONS(234), 1,
      aux_sym_comment_token1,
};

static const uint32_t ts_small_parse_table_map[] = {
  [SMALL_STATE(5)] = 0,
  [SMALL_STATE(6)] = 39,
  [SMALL_STATE(7)] = 78,
  [SMALL_STATE(8)] = 117,
  [SMALL_STATE(9)] = 151,
  [SMALL_STATE(10)] = 185,
  [SMALL_STATE(11)] = 219,
  [SMALL_STATE(12)] = 249,
  [SMALL_STATE(13)] = 275,
  [SMALL_STATE(14)] = 301,
  [SMALL_STATE(15)] = 313,
  [SMALL_STATE(16)] = 325,
  [SMALL_STATE(17)] = 337,
  [SMALL_STATE(18)] = 349,
  [SMALL_STATE(19)] = 361,
  [SMALL_STATE(20)] = 383,
  [SMALL_STATE(21)] = 395,
  [SMALL_STATE(22)] = 407,
  [SMALL_STATE(23)] = 417,
  [SMALL_STATE(24)] = 427,
  [SMALL_STATE(25)] = 442,
  [SMALL_STATE(26)] = 457,
  [SMALL_STATE(27)] = 474,
  [SMALL_STATE(28)] = 491,
  [SMALL_STATE(29)] = 506,
  [SMALL_STATE(30)] = 521,
  [SMALL_STATE(31)] = 529,
  [SMALL_STATE(32)] = 545,
  [SMALL_STATE(33)] = 561,
  [SMALL_STATE(34)] = 573,
  [SMALL_STATE(35)] = 587,
  [SMALL_STATE(36)] = 599,
  [SMALL_STATE(37)] = 613,
  [SMALL_STATE(38)] = 627,
  [SMALL_STATE(39)] = 643,
  [SMALL_STATE(40)] = 655,
  [SMALL_STATE(41)] = 663,
  [SMALL_STATE(42)] = 671,
  [SMALL_STATE(43)] = 680,
  [SMALL_STATE(44)] = 689,
  [SMALL_STATE(45)] = 698,
  [SMALL_STATE(46)] = 707,
  [SMALL_STATE(47)] = 715,
  [SMALL_STATE(48)] = 722,
  [SMALL_STATE(49)] = 727,
  [SMALL_STATE(50)] = 734,
  [SMALL_STATE(51)] = 741,
  [SMALL_STATE(52)] = 745,
  [SMALL_STATE(53)] = 749,
  [SMALL_STATE(54)] = 753,
  [SMALL_STATE(55)] = 757,
  [SMALL_STATE(56)] = 761,
  [SMALL_STATE(57)] = 765,
  [SMALL_STATE(58)] = 769,
  [SMALL_STATE(59)] = 773,
  [SMALL_STATE(60)] = 777,
  [SMALL_STATE(61)] = 781,
  [SMALL_STATE(62)] = 785,
  [SMALL_STATE(63)] = 789,
  [SMALL_STATE(64)] = 793,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, SHIFT(19),
  [5] = {.entry = {.count = 1, .reusable = true}}, SHIFT(32),
  [7] = {.entry = {.count = 1, .reusable = true}}, SHIFT(64),
  [9] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym__body, 2),
  [11] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(2),
  [14] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(49),
  [17] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(40),
  [20] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(9),
  [23] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(58),
  [26] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(25),
  [29] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(64),
  [32] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 1),
  [34] = {.entry = {.count = 1, .reusable = true}}, SHIFT(4),
  [36] = {.entry = {.count = 1, .reusable = true}}, SHIFT(49),
  [38] = {.entry = {.count = 1, .reusable = true}}, SHIFT(40),
  [40] = {.entry = {.count = 1, .reusable = true}}, SHIFT(9),
  [42] = {.entry = {.count = 1, .reusable = true}}, SHIFT(58),
  [44] = {.entry = {.count = 1, .reusable = true}}, SHIFT(25),
  [46] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 2),
  [48] = {.entry = {.count = 1, .reusable = true}}, SHIFT(2),
  [50] = {.entry = {.count = 1, .reusable = true}}, SHIFT(18),
  [52] = {.entry = {.count = 1, .reusable = true}}, SHIFT(23),
  [54] = {.entry = {.count = 1, .reusable = true}}, SHIFT(56),
  [56] = {.entry = {.count = 1, .reusable = true}}, SHIFT(20),
  [58] = {.entry = {.count = 1, .reusable = true}}, SHIFT(15),
  [60] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2),
  [62] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(49),
  [65] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(40),
  [68] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(23),
  [71] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(58),
  [74] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(25),
  [77] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_bar, 1),
  [79] = {.entry = {.count = 1, .reusable = true}}, SHIFT(10),
  [81] = {.entry = {.count = 1, .reusable = true}}, SHIFT(22),
  [83] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(49),
  [86] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(40),
  [89] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2),
  [91] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(58),
  [94] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(25),
  [97] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 5),
  [99] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 2),
  [101] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment, 3),
  [103] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 2),
  [105] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 3),
  [107] = {.entry = {.count = 1, .reusable = true}}, SHIFT(28),
  [109] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 4),
  [111] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 3),
  [113] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_bar, 2),
  [115] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 3),
  [117] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 3),
  [119] = {.entry = {.count = 1, .reusable = false}}, SHIFT(33),
  [121] = {.entry = {.count = 1, .reusable = false}}, SHIFT(43),
  [123] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 1),
  [125] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 1),
  [127] = {.entry = {.count = 1, .reusable = false}}, SHIFT(35),
  [129] = {.entry = {.count = 1, .reusable = false}}, SHIFT(44),
  [131] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_cluster_repeat1, 2), SHIFT_REPEAT(47),
  [134] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_cluster_repeat1, 2),
  [136] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_cluster_repeat1, 2), SHIFT_REPEAT(58),
  [139] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_cluster_repeat1, 2), SHIFT_REPEAT(25),
  [142] = {.entry = {.count = 1, .reusable = false}}, SHIFT(47),
  [144] = {.entry = {.count = 1, .reusable = true}}, SHIFT(30),
  [146] = {.entry = {.count = 1, .reusable = false}}, SHIFT(58),
  [148] = {.entry = {.count = 1, .reusable = false}}, SHIFT(25),
  [150] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(28),
  [153] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2),
  [155] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(64),
  [158] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2),
  [160] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2),
  [162] = {.entry = {.count = 1, .reusable = false}}, SHIFT(39),
  [164] = {.entry = {.count = 1, .reusable = false}}, SHIFT(45),
  [166] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_cluster, 2),
  [168] = {.entry = {.count = 1, .reusable = false}}, SHIFT(21),
  [170] = {.entry = {.count = 1, .reusable = true}}, SHIFT(46),
  [172] = {.entry = {.count = 1, .reusable = false}}, SHIFT(17),
  [174] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 4),
  [176] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 4),
  [178] = {.entry = {.count = 1, .reusable = false}}, SHIFT(42),
  [180] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 1),
  [182] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2),
  [184] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2), SHIFT_REPEAT(32),
  [187] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 2),
  [189] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_header_repeat1, 2),
  [191] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2), SHIFT_REPEAT(46),
  [194] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 1),
  [196] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 3),
  [198] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 5),
  [200] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 5),
  [202] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__field_parts, 1),
  [204] = {.entry = {.count = 1, .reusable = true}}, SHIFT(60),
  [206] = {.entry = {.count = 1, .reusable = true}}, SHIFT(63),
  [208] = {.entry = {.count = 1, .reusable = true}}, SHIFT(29),
  [210] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__field_parts, 3),
  [212] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2),
  [214] = {.entry = {.count = 1, .reusable = true}}, SHIFT(41),
  [216] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__header_field, 1, .production_id = 1),
  [218] = {.entry = {.count = 1, .reusable = true}}, SHIFT(16),
  [220] = {.entry = {.count = 1, .reusable = true}}, SHIFT(50),
  [222] = {.entry = {.count = 1, .reusable = true}}, SHIFT(59),
  [224] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tail_comment, 2),
  [226] = {.entry = {.count = 1, .reusable = true}}, SHIFT(48),
  [228] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
  [230] = {.entry = {.count = 1, .reusable = true}}, SHIFT(14),
  [232] = {.entry = {.count = 1, .reusable = true}}, SHIFT(24),
  [234] = {.entry = {.count = 1, .reusable = true}}, SHIFT(53),
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
