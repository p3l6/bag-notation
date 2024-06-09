#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 14
#define STATE_COUNT 60
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
};

static bool ts_lex(TSLexer *lexer, TSStateId state) {
  START_LEXER();
  eof = lexer->eof(lexer);
  switch (state) {
    case 0:
      if (eof) ADVANCE(10);
      if (lookahead == '\n') ADVANCE(11);
      if (lookahead == '#') ADVANCE(30);
      if (lookahead == '&') ADVANCE(15);
      if (lookahead == '(') ADVANCE(13);
      if (lookahead == ')') ADVANCE(14);
      if (lookahead == '-') ADVANCE(29);
      if (lookahead == ':') ADVANCE(17);
      if (lookahead == '|') ADVANCE(23);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(0)
      if (lookahead == '_' ||
          lookahead == '~') ADVANCE(28);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(27);
      if (('a' <= lookahead && lookahead <= 'h') ||
          lookahead == 'l') ADVANCE(26);
      if (('j' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(25);
      END_STATE();
    case 1:
      if (lookahead == '\t') SKIP(1)
      if (lookahead == ' ') ADVANCE(18);
      if (lookahead == '-') ADVANCE(5);
      if (lookahead == '\'' ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(19);
      END_STATE();
    case 2:
      if (lookahead == '\t') SKIP(2)
      if (lookahead == ' ') ADVANCE(20);
      if (lookahead == '\'' ||
          (',' <= lookahead && lookahead <= '9') ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(21);
      END_STATE();
    case 3:
      if (lookahead == '\n') ADVANCE(11);
      if (lookahead == ')') ADVANCE(14);
      if (lookahead == ':') ADVANCE(16);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(3)
      END_STATE();
    case 4:
      if (lookahead == '\n') ADVANCE(12);
      END_STATE();
    case 5:
      if (lookahead == '-') ADVANCE(6);
      END_STATE();
    case 6:
      if (lookahead == '-') ADVANCE(4);
      END_STATE();
    case 7:
      if (lookahead == '|') ADVANCE(23);
      END_STATE();
    case 8:
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(24);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(27);
      if (lookahead == '-' ||
          lookahead == '_' ||
          lookahead == '~') ADVANCE(28);
      if (('a' <= lookahead && lookahead <= 'h') ||
          lookahead == 'l') ADVANCE(26);
      if (('j' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(25);
      END_STATE();
    case 9:
      if (eof) ADVANCE(10);
      if (lookahead == '\n') ADVANCE(11);
      if (lookahead == '#') ADVANCE(30);
      if (lookahead == '&') ADVANCE(15);
      if (lookahead == '(') ADVANCE(13);
      if (lookahead == '-') ADVANCE(5);
      if (lookahead == ':') ADVANCE(7);
      if (lookahead == '|') ADVANCE(23);
      if (lookahead == '\t' ||
          lookahead == ' ') SKIP(9)
      if (('a' <= lookahead && lookahead <= 'h') ||
          lookahead == 'l') ADVANCE(26);
      if (('j' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(25);
      END_STATE();
    case 10:
      ACCEPT_TOKEN(ts_builtin_sym_end);
      END_STATE();
    case 11:
      ACCEPT_TOKEN(anon_sym_LF);
      END_STATE();
    case 12:
      ACCEPT_TOKEN(anon_sym_DASH_DASH_DASH_LF);
      END_STATE();
    case 13:
      ACCEPT_TOKEN(anon_sym_LPAREN);
      END_STATE();
    case 14:
      ACCEPT_TOKEN(anon_sym_RPAREN);
      END_STATE();
    case 15:
      ACCEPT_TOKEN(sym_shorthand_label);
      END_STATE();
    case 16:
      ACCEPT_TOKEN(anon_sym_COLON);
      END_STATE();
    case 17:
      ACCEPT_TOKEN(anon_sym_COLON);
      if (lookahead == '|') ADVANCE(23);
      END_STATE();
    case 18:
      ACCEPT_TOKEN(sym_field_label);
      if (lookahead == ' ') ADVANCE(18);
      if (lookahead == '\'' ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(19);
      END_STATE();
    case 19:
      ACCEPT_TOKEN(sym_field_label);
      if (lookahead == ' ' ||
          lookahead == '\'' ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(19);
      END_STATE();
    case 20:
      ACCEPT_TOKEN(sym_field_value);
      if (lookahead == ' ') ADVANCE(20);
      if (lookahead == '\'' ||
          (',' <= lookahead && lookahead <= '9') ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(21);
      END_STATE();
    case 21:
      ACCEPT_TOKEN(sym_field_value);
      if (lookahead == ' ' ||
          lookahead == '\'' ||
          (',' <= lookahead && lookahead <= '9') ||
          ('A' <= lookahead && lookahead <= 'Z') ||
          ('a' <= lookahead && lookahead <= 'z')) ADVANCE(21);
      END_STATE();
    case 22:
      ACCEPT_TOKEN(sym_barline);
      END_STATE();
    case 23:
      ACCEPT_TOKEN(sym_barline);
      if (lookahead == ':') ADVANCE(22);
      if (lookahead == '|') ADVANCE(23);
      END_STATE();
    case 24:
      ACCEPT_TOKEN(aux_sym_cluster_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(24);
      END_STATE();
    case 25:
      ACCEPT_TOKEN(sym_embellishment);
      if (lookahead == 'j' ||
          lookahead == 'k' ||
          ('m' <= lookahead && lookahead <= 'v') ||
          ('x' <= lookahead && lookahead <= 'z')) ADVANCE(25);
      END_STATE();
    case 26:
      ACCEPT_TOKEN(sym_pitch);
      END_STATE();
    case 27:
      ACCEPT_TOKEN(sym_duration);
      if (lookahead == '+' ||
          lookahead == '.' ||
          lookahead == '/') ADVANCE(27);
      END_STATE();
    case 28:
      ACCEPT_TOKEN(sym_connector);
      END_STATE();
    case 29:
      ACCEPT_TOKEN(sym_connector);
      if (lookahead == '-') ADVANCE(6);
      END_STATE();
    case 30:
      ACCEPT_TOKEN(anon_sym_POUND);
      END_STATE();
    case 31:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead == '\t' ||
          lookahead == ' ') ADVANCE(31);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(32);
      END_STATE();
    case 32:
      ACCEPT_TOKEN(aux_sym_comment_token1);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(32);
      END_STATE();
    default:
      return false;
  }
}

static const TSLexMode ts_lex_modes[STATE_COUNT] = {
  [0] = {.lex_state = 0},
  [1] = {.lex_state = 9},
  [2] = {.lex_state = 9},
  [3] = {.lex_state = 9},
  [4] = {.lex_state = 9},
  [5] = {.lex_state = 9},
  [6] = {.lex_state = 9},
  [7] = {.lex_state = 9},
  [8] = {.lex_state = 9},
  [9] = {.lex_state = 9},
  [10] = {.lex_state = 9},
  [11] = {.lex_state = 9},
  [12] = {.lex_state = 9},
  [13] = {.lex_state = 9},
  [14] = {.lex_state = 9},
  [15] = {.lex_state = 9},
  [16] = {.lex_state = 9},
  [17] = {.lex_state = 9},
  [18] = {.lex_state = 9},
  [19] = {.lex_state = 9},
  [20] = {.lex_state = 9},
  [21] = {.lex_state = 9},
  [22] = {.lex_state = 9},
  [23] = {.lex_state = 9},
  [24] = {.lex_state = 9},
  [25] = {.lex_state = 9},
  [26] = {.lex_state = 8},
  [27] = {.lex_state = 9},
  [28] = {.lex_state = 9},
  [29] = {.lex_state = 8},
  [30] = {.lex_state = 9},
  [31] = {.lex_state = 1},
  [32] = {.lex_state = 1},
  [33] = {.lex_state = 8},
  [34] = {.lex_state = 9},
  [35] = {.lex_state = 8},
  [36] = {.lex_state = 1},
  [37] = {.lex_state = 9},
  [38] = {.lex_state = 8},
  [39] = {.lex_state = 8},
  [40] = {.lex_state = 8},
  [41] = {.lex_state = 8},
  [42] = {.lex_state = 3},
  [43] = {.lex_state = 8},
  [44] = {.lex_state = 1},
  [45] = {.lex_state = 1},
  [46] = {.lex_state = 0},
  [47] = {.lex_state = 0},
  [48] = {.lex_state = 0},
  [49] = {.lex_state = 0},
  [50] = {.lex_state = 2},
  [51] = {.lex_state = 0},
  [52] = {.lex_state = 0},
  [53] = {.lex_state = 31},
  [54] = {.lex_state = 0},
  [55] = {.lex_state = 0},
  [56] = {.lex_state = 0},
  [57] = {.lex_state = 0},
  [58] = {.lex_state = 0},
  [59] = {.lex_state = 31},
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
    [sym_barline] = ACTIONS(1),
    [sym_embellishment] = ACTIONS(1),
    [sym_pitch] = ACTIONS(1),
    [sym_duration] = ACTIONS(1),
    [sym_connector] = ACTIONS(1),
    [anon_sym_POUND] = ACTIONS(1),
  },
  [1] = {
    [sym_file] = STATE(56),
    [sym_tune] = STATE(34),
    [sym_header] = STATE(2),
    [sym__blank_line] = STATE(15),
    [sym_comment] = STATE(15),
    [aux_sym_file_repeat1] = STATE(15),
    [aux_sym_file_repeat2] = STATE(34),
    [anon_sym_LF] = ACTIONS(3),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(5),
    [anon_sym_POUND] = ACTIONS(7),
  },
  [2] = {
    [aux_sym__body] = STATE(4),
    [sym_voice] = STATE(4),
    [sym_field] = STATE(11),
    [sym_bar] = STATE(7),
    [sym__bar_content] = STATE(12),
    [sym_cluster] = STATE(12),
    [sym_note] = STATE(26),
    [sym__blank_line] = STATE(4),
    [sym_comment] = STATE(4),
    [aux_sym_voice_repeat1] = STATE(7),
    [aux_sym_bar_repeat1] = STATE(12),
    [aux_sym_cluster_repeat1] = STATE(26),
    [ts_builtin_sym_end] = ACTIONS(9),
    [anon_sym_LF] = ACTIONS(11),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(9),
    [anon_sym_LPAREN] = ACTIONS(13),
    [sym_shorthand_label] = ACTIONS(15),
    [sym_barline] = ACTIONS(17),
    [sym_embellishment] = ACTIONS(19),
    [sym_pitch] = ACTIONS(21),
    [anon_sym_POUND] = ACTIONS(7),
  },
  [3] = {
    [aux_sym__body] = STATE(3),
    [sym_voice] = STATE(3),
    [sym_field] = STATE(11),
    [sym_bar] = STATE(7),
    [sym__bar_content] = STATE(12),
    [sym_cluster] = STATE(12),
    [sym_note] = STATE(26),
    [sym__blank_line] = STATE(3),
    [sym_comment] = STATE(3),
    [aux_sym_voice_repeat1] = STATE(7),
    [aux_sym_bar_repeat1] = STATE(12),
    [aux_sym_cluster_repeat1] = STATE(26),
    [ts_builtin_sym_end] = ACTIONS(23),
    [anon_sym_LF] = ACTIONS(25),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(23),
    [anon_sym_LPAREN] = ACTIONS(28),
    [sym_shorthand_label] = ACTIONS(31),
    [sym_barline] = ACTIONS(34),
    [sym_embellishment] = ACTIONS(37),
    [sym_pitch] = ACTIONS(40),
    [anon_sym_POUND] = ACTIONS(43),
  },
  [4] = {
    [aux_sym__body] = STATE(3),
    [sym_voice] = STATE(3),
    [sym_field] = STATE(11),
    [sym_bar] = STATE(7),
    [sym__bar_content] = STATE(12),
    [sym_cluster] = STATE(12),
    [sym_note] = STATE(26),
    [sym__blank_line] = STATE(3),
    [sym_comment] = STATE(3),
    [aux_sym_voice_repeat1] = STATE(7),
    [aux_sym_bar_repeat1] = STATE(12),
    [aux_sym_cluster_repeat1] = STATE(26),
    [ts_builtin_sym_end] = ACTIONS(46),
    [anon_sym_LF] = ACTIONS(48),
    [anon_sym_DASH_DASH_DASH_LF] = ACTIONS(46),
    [anon_sym_LPAREN] = ACTIONS(13),
    [sym_shorthand_label] = ACTIONS(15),
    [sym_barline] = ACTIONS(17),
    [sym_embellishment] = ACTIONS(19),
    [sym_pitch] = ACTIONS(21),
    [anon_sym_POUND] = ACTIONS(7),
  },
};

static const uint16_t ts_small_parse_table[] = {
  [0] = 11,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(15), 1,
      sym_shorthand_label,
    ACTIONS(19), 1,
      sym_embellishment,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(50), 1,
      anon_sym_LF,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(54), 1,
      anon_sym_POUND,
    STATE(58), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(26), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [39] = 11,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(15), 1,
      sym_shorthand_label,
    ACTIONS(19), 1,
      sym_embellishment,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(54), 1,
      anon_sym_POUND,
    ACTIONS(56), 1,
      anon_sym_LF,
    STATE(51), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(26), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [78] = 11,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(15), 1,
      sym_shorthand_label,
    ACTIONS(19), 1,
      sym_embellishment,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(54), 1,
      anon_sym_POUND,
    ACTIONS(58), 1,
      anon_sym_LF,
    STATE(52), 1,
      sym_tail_comment,
    STATE(8), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(26), 2,
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
    STATE(26), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [151] = 9,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(15), 1,
      sym_shorthand_label,
    ACTIONS(19), 1,
      sym_embellishment,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(77), 2,
      anon_sym_LF,
      anon_sym_POUND,
    STATE(5), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(26), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [185] = 9,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(15), 1,
      sym_shorthand_label,
    ACTIONS(19), 1,
      sym_embellishment,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(52), 1,
      sym_barline,
    ACTIONS(77), 2,
      anon_sym_LF,
      anon_sym_POUND,
    STATE(6), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(26), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [219] = 8,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(15), 1,
      sym_shorthand_label,
    ACTIONS(19), 1,
      sym_embellishment,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(79), 1,
      sym_barline,
    STATE(6), 2,
      sym_bar,
      aux_sym_voice_repeat1,
    STATE(26), 2,
      sym_note,
      aux_sym_cluster_repeat1,
    STATE(12), 4,
      sym_field,
      sym__bar_content,
      sym_cluster,
      aux_sym_bar_repeat1,
  [249] = 7,
    ACTIONS(13), 1,
      anon_sym_LPAREN,
    ACTIONS(15), 1,
      sym_shorthand_label,
    ACTIONS(19), 1,
      sym_embellishment,
    ACTIONS(21), 1,
      sym_pitch,
    ACTIONS(81), 1,
      sym_barline,
    STATE(26), 2,
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
    STATE(26), 2,
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
  [313] = 6,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(7), 1,
      anon_sym_POUND,
    ACTIONS(99), 1,
      anon_sym_LF,
    STATE(2), 1,
      sym_header,
    STATE(27), 2,
      sym_tune,
      aux_sym_file_repeat2,
    STATE(24), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [335] = 1,
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
  [347] = 1,
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
  [359] = 1,
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
  [371] = 1,
    ACTIONS(107), 9,
      ts_builtin_sym_end,
      anon_sym_LF,
      anon_sym_DASH_DASH_DASH_LF,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
      anon_sym_POUND,
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
    ACTIONS(115), 1,
      anon_sym_LF,
    ACTIONS(118), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(120), 1,
      anon_sym_POUND,
    STATE(24), 3,
      sym__blank_line,
      sym_comment,
      aux_sym_file_repeat1,
  [442] = 1,
    ACTIONS(123), 5,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
  [450] = 4,
    ACTIONS(125), 1,
      aux_sym_cluster_token1,
    ACTIONS(127), 1,
      sym_embellishment,
    ACTIONS(129), 1,
      sym_pitch,
    STATE(29), 2,
      sym_note,
      aux_sym_cluster_repeat1,
  [464] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(131), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(28), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [478] = 4,
    ACTIONS(133), 1,
      ts_builtin_sym_end,
    ACTIONS(135), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(2), 1,
      sym_header,
    STATE(28), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [492] = 4,
    ACTIONS(138), 1,
      aux_sym_cluster_token1,
    ACTIONS(140), 1,
      sym_embellishment,
    ACTIONS(143), 1,
      sym_pitch,
    STATE(29), 2,
      sym_note,
      aux_sym_cluster_repeat1,
  [506] = 1,
    ACTIONS(146), 5,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
  [514] = 5,
    ACTIONS(148), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(150), 1,
      sym_field_label,
    STATE(31), 1,
      aux_sym_header_repeat1,
    STATE(48), 1,
      sym__field_parts,
    STATE(49), 1,
      sym__header_field,
  [530] = 5,
    ACTIONS(153), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(155), 1,
      sym_field_label,
    STATE(36), 1,
      aux_sym_header_repeat1,
    STATE(48), 1,
      sym__field_parts,
    STATE(49), 1,
      sym__header_field,
  [546] = 4,
    ACTIONS(157), 1,
      aux_sym_cluster_token1,
    ACTIONS(161), 1,
      sym_duration,
    ACTIONS(163), 1,
      sym_connector,
    ACTIONS(159), 2,
      sym_embellishment,
      sym_pitch,
  [560] = 4,
    ACTIONS(5), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(165), 1,
      ts_builtin_sym_end,
    STATE(2), 1,
      sym_header,
    STATE(28), 2,
      sym_tune,
      aux_sym_file_repeat2,
  [574] = 4,
    ACTIONS(167), 1,
      aux_sym_cluster_token1,
    ACTIONS(171), 1,
      sym_duration,
    ACTIONS(173), 1,
      sym_connector,
    ACTIONS(169), 2,
      sym_embellishment,
      sym_pitch,
  [588] = 5,
    ACTIONS(155), 1,
      sym_field_label,
    ACTIONS(175), 1,
      anon_sym_DASH_DASH_DASH_LF,
    STATE(31), 1,
      aux_sym_header_repeat1,
    STATE(48), 1,
      sym__field_parts,
    STATE(49), 1,
      sym__header_field,
  [604] = 1,
    ACTIONS(177), 5,
      anon_sym_LPAREN,
      sym_shorthand_label,
      sym_barline,
      sym_embellishment,
      sym_pitch,
  [612] = 3,
    ACTIONS(179), 1,
      aux_sym_cluster_token1,
    ACTIONS(183), 1,
      sym_connector,
    ACTIONS(181), 2,
      sym_embellishment,
      sym_pitch,
  [623] = 3,
    ACTIONS(167), 1,
      aux_sym_cluster_token1,
    ACTIONS(173), 1,
      sym_connector,
    ACTIONS(169), 2,
      sym_embellishment,
      sym_pitch,
  [634] = 2,
    ACTIONS(179), 1,
      aux_sym_cluster_token1,
    ACTIONS(181), 2,
      sym_embellishment,
      sym_pitch,
  [642] = 2,
    ACTIONS(167), 1,
      aux_sym_cluster_token1,
    ACTIONS(169), 2,
      sym_embellishment,
      sym_pitch,
  [650] = 2,
    ACTIONS(187), 1,
      anon_sym_COLON,
    ACTIONS(185), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [658] = 2,
    ACTIONS(189), 1,
      aux_sym_cluster_token1,
    ACTIONS(191), 2,
      sym_embellishment,
      sym_pitch,
  [666] = 2,
    ACTIONS(155), 1,
      sym_field_label,
    STATE(47), 1,
      sym__field_parts,
  [673] = 2,
    ACTIONS(148), 1,
      anon_sym_DASH_DASH_DASH_LF,
    ACTIONS(193), 1,
      sym_field_label,
  [680] = 1,
    ACTIONS(195), 2,
      anon_sym_LF,
      anon_sym_RPAREN,
  [685] = 1,
    ACTIONS(197), 1,
      anon_sym_RPAREN,
  [689] = 1,
    ACTIONS(199), 1,
      anon_sym_LF,
  [693] = 1,
    ACTIONS(201), 1,
      anon_sym_LF,
  [697] = 1,
    ACTIONS(203), 1,
      sym_field_value,
  [701] = 1,
    ACTIONS(50), 1,
      anon_sym_LF,
  [705] = 1,
    ACTIONS(56), 1,
      anon_sym_LF,
  [709] = 1,
    ACTIONS(205), 1,
      aux_sym_comment_token1,
  [713] = 1,
    ACTIONS(207), 1,
      anon_sym_LF,
  [717] = 1,
    ACTIONS(209), 1,
      anon_sym_LF,
  [721] = 1,
    ACTIONS(211), 1,
      ts_builtin_sym_end,
  [725] = 1,
    ACTIONS(213), 1,
      sym_pitch,
  [729] = 1,
    ACTIONS(215), 1,
      anon_sym_LF,
  [733] = 1,
    ACTIONS(217), 1,
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
  [SMALL_STATE(16)] = 335,
  [SMALL_STATE(17)] = 347,
  [SMALL_STATE(18)] = 359,
  [SMALL_STATE(19)] = 371,
  [SMALL_STATE(20)] = 383,
  [SMALL_STATE(21)] = 395,
  [SMALL_STATE(22)] = 407,
  [SMALL_STATE(23)] = 417,
  [SMALL_STATE(24)] = 427,
  [SMALL_STATE(25)] = 442,
  [SMALL_STATE(26)] = 450,
  [SMALL_STATE(27)] = 464,
  [SMALL_STATE(28)] = 478,
  [SMALL_STATE(29)] = 492,
  [SMALL_STATE(30)] = 506,
  [SMALL_STATE(31)] = 514,
  [SMALL_STATE(32)] = 530,
  [SMALL_STATE(33)] = 546,
  [SMALL_STATE(34)] = 560,
  [SMALL_STATE(35)] = 574,
  [SMALL_STATE(36)] = 588,
  [SMALL_STATE(37)] = 604,
  [SMALL_STATE(38)] = 612,
  [SMALL_STATE(39)] = 623,
  [SMALL_STATE(40)] = 634,
  [SMALL_STATE(41)] = 642,
  [SMALL_STATE(42)] = 650,
  [SMALL_STATE(43)] = 658,
  [SMALL_STATE(44)] = 666,
  [SMALL_STATE(45)] = 673,
  [SMALL_STATE(46)] = 680,
  [SMALL_STATE(47)] = 685,
  [SMALL_STATE(48)] = 689,
  [SMALL_STATE(49)] = 693,
  [SMALL_STATE(50)] = 697,
  [SMALL_STATE(51)] = 701,
  [SMALL_STATE(52)] = 705,
  [SMALL_STATE(53)] = 709,
  [SMALL_STATE(54)] = 713,
  [SMALL_STATE(55)] = 717,
  [SMALL_STATE(56)] = 721,
  [SMALL_STATE(57)] = 725,
  [SMALL_STATE(58)] = 729,
  [SMALL_STATE(59)] = 733,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, SHIFT(15),
  [5] = {.entry = {.count = 1, .reusable = true}}, SHIFT(32),
  [7] = {.entry = {.count = 1, .reusable = true}}, SHIFT(59),
  [9] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 1),
  [11] = {.entry = {.count = 1, .reusable = true}}, SHIFT(4),
  [13] = {.entry = {.count = 1, .reusable = true}}, SHIFT(44),
  [15] = {.entry = {.count = 1, .reusable = true}}, SHIFT(37),
  [17] = {.entry = {.count = 1, .reusable = true}}, SHIFT(10),
  [19] = {.entry = {.count = 1, .reusable = true}}, SHIFT(57),
  [21] = {.entry = {.count = 1, .reusable = true}}, SHIFT(33),
  [23] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym__body, 2),
  [25] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(3),
  [28] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(44),
  [31] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(37),
  [34] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(10),
  [37] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(57),
  [40] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(33),
  [43] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__body, 2), SHIFT_REPEAT(59),
  [46] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tune, 2),
  [48] = {.entry = {.count = 1, .reusable = true}}, SHIFT(3),
  [50] = {.entry = {.count = 1, .reusable = true}}, SHIFT(14),
  [52] = {.entry = {.count = 1, .reusable = true}}, SHIFT(23),
  [54] = {.entry = {.count = 1, .reusable = true}}, SHIFT(53),
  [56] = {.entry = {.count = 1, .reusable = true}}, SHIFT(16),
  [58] = {.entry = {.count = 1, .reusable = true}}, SHIFT(19),
  [60] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2),
  [62] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(44),
  [65] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(37),
  [68] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(23),
  [71] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(57),
  [74] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_voice_repeat1, 2), SHIFT_REPEAT(33),
  [77] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_bar, 1),
  [79] = {.entry = {.count = 1, .reusable = true}}, SHIFT(9),
  [81] = {.entry = {.count = 1, .reusable = true}}, SHIFT(22),
  [83] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(44),
  [86] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(37),
  [89] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2),
  [91] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(57),
  [94] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_bar_repeat1, 2), SHIFT_REPEAT(33),
  [97] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 4),
  [99] = {.entry = {.count = 1, .reusable = true}}, SHIFT(24),
  [101] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 3),
  [103] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 2),
  [105] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 5),
  [107] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_voice, 2),
  [109] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment, 3),
  [111] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_header, 3),
  [113] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_bar, 2),
  [115] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(24),
  [118] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2),
  [120] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat1, 2), SHIFT_REPEAT(59),
  [123] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 3),
  [125] = {.entry = {.count = 1, .reusable = true}}, SHIFT(30),
  [127] = {.entry = {.count = 1, .reusable = false}}, SHIFT(57),
  [129] = {.entry = {.count = 1, .reusable = false}}, SHIFT(33),
  [131] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 2),
  [133] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2),
  [135] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_file_repeat2, 2), SHIFT_REPEAT(32),
  [138] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_cluster_repeat1, 2),
  [140] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_cluster_repeat1, 2), SHIFT_REPEAT(57),
  [143] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_cluster_repeat1, 2), SHIFT_REPEAT(33),
  [146] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_cluster, 2),
  [148] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_header_repeat1, 2),
  [150] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2), SHIFT_REPEAT(42),
  [153] = {.entry = {.count = 1, .reusable = false}}, SHIFT(17),
  [155] = {.entry = {.count = 1, .reusable = true}}, SHIFT(42),
  [157] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 1),
  [159] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 1),
  [161] = {.entry = {.count = 1, .reusable = false}}, SHIFT(39),
  [163] = {.entry = {.count = 1, .reusable = false}}, SHIFT(41),
  [165] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_file, 1),
  [167] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 2),
  [169] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 2),
  [171] = {.entry = {.count = 1, .reusable = false}}, SHIFT(38),
  [173] = {.entry = {.count = 1, .reusable = false}}, SHIFT(40),
  [175] = {.entry = {.count = 1, .reusable = false}}, SHIFT(21),
  [177] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_field, 1),
  [179] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 3),
  [181] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 3),
  [183] = {.entry = {.count = 1, .reusable = false}}, SHIFT(43),
  [185] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__field_parts, 1),
  [187] = {.entry = {.count = 1, .reusable = true}}, SHIFT(50),
  [189] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_note, 4),
  [191] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_note, 4),
  [193] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_header_repeat1, 2),
  [195] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__field_parts, 3),
  [197] = {.entry = {.count = 1, .reusable = true}}, SHIFT(25),
  [199] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__header_field, 1, .production_id = 1),
  [201] = {.entry = {.count = 1, .reusable = true}}, SHIFT(45),
  [203] = {.entry = {.count = 1, .reusable = true}}, SHIFT(46),
  [205] = {.entry = {.count = 1, .reusable = true}}, SHIFT(55),
  [207] = {.entry = {.count = 1, .reusable = true}}, SHIFT(20),
  [209] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_tail_comment, 2),
  [211] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
  [213] = {.entry = {.count = 1, .reusable = true}}, SHIFT(35),
  [215] = {.entry = {.count = 1, .reusable = true}}, SHIFT(18),
  [217] = {.entry = {.count = 1, .reusable = true}}, SHIFT(54),
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
