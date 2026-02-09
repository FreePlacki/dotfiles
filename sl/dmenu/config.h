/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int instant = 0;                     /* -n  option; if 1, select single entry automatically */
static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy  = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const int user_bh = 16;               /* add a defined amount of pixels to the bar height */
static const char *fonts[] = {
	"monospace:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
    [SchemeNorm] = { "#ebdbb2", "#1d2021" },
	[SchemeSel] = { "#ebdbb2", "#98971a" },
	[SchemeOut] = { "#ebdbb2", "#8ec07c" },
    [SchemeSelHighlight] = { "#ebdbb2", "#458588" },
	[SchemeNormHighlight] = { "#ebdbb2", "#458588" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
