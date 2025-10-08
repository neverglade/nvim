---@type Neverglade.HighlightGroup
local M = {}

function M.get()
	--- LSP highlight groups yanked (with many thanks!) from Catppuccin.
	local v_text_gray = O.diagnostics.virtual == "gray"
	local text = O.diagnostics.text

	local error = C.ember
	local warning = C.ochre
	local info = C.sky
	local hint = C.aurora
	local ok = C.lichen

	local darken = 0.1

	return {
		LspReferenceText = { bg = C.sapwood },
		LspReferenceRead = { bg = C.sapwood },
		LspReferenceWrite = { bg = C.sapwood },

		DiagnosticVirtualTextError = {
			bg = O.transparent_background and C.none or U.blend_bg(error, darken, C.root),
			fg = v_text_gray and C.gray1 or error,
		},
		DiagnosticVirtualTextWarn = {
			bg = O.transparent_background and C.none or U.blend_bg(warning, darken, C.root),
			fg = v_text_gray and C.gray1 or warning,
		},
		DiagnosticVirtualTextInfo = {
			bg = O.transparent_background and C.none or U.blend_bg(info, darken, C.root),
			fg = v_text_gray and C.gray1 or info,
		},
		DiagnosticVirtualTextHint = {
			bg = O.transparent_background and C.none or U.blend_bg(info, darken, C.root),
			fg = v_text_gray and C.gray1 or hint,
		},
		DiagnosticVirtualTextOk = {
			bg = O.transparent_background and C.none or U.blend_bg(info, darken, C.root),
			fg = v_text_gray and C.gray1 or ok,
		},

		DiagnosticError = { fg = error },
		DiagnosticWarn = { fg = warning },
		DiagnosticInfo = { fg = info },
		DiagnosticHint = { fg = hint },
		DiagnosticOk = { fg = ok },

		DiagnosticUnderlineError = { style = { S.underline }, sp = error },
		DiagnosticUnderlineWarn = { style = { S.underline }, sp = warning },
		DiagnosticUnderlineInfo = { style = { S.underline }, sp = info },
		DiagnosticUnderlineHint = { style = { S.underline }, sp = hint },
		DiagnosticUnderlineOk = { style = { S.underline }, sp = ok },

		DiagnosticFloatingError = { fg = error },
		DiagnosticFloatingWarn = { fg = warning },
		DiagnosticFloatingInfo = { fg = info },
		DiagnosticFloatingHint = { fg = hint },
		DiagnosticFloatingOk = { fg = ok },

		DiagnosticSignError = { fg = error },
		DiagnosticSignWarn = { fg = warning },
		DiagnosticSignInfo = { fg = info },
		DiagnosticSignHint = { fg = hint },
		DiagnosticSignOk = { fg = ok },

		LspDiagnosticsDefaultError = { fg = error },
		LspDiagnosticsDefaultWarning = { fg = warning },
		LspDiagnosticsDefaultInformation = { fg = info },
		LspDiagnosticsDefaultHint = { fg = hint },
		LspSignatureActiveParameter = { bg = C.heartwood, style = { "bold" } },

		LspDiagnosticsError = { fg = error },
		LspDiagnosticsWarning = { fg = warning },
		LspDiagnosticsInformation = { fg = info },
		LspDiagnosticsHint = { fg = hint },

		LspDiagnosticsVirtualTextError = { fg = v_text_gray and C.gray1 or error },
		LspDiagnosticsVirtualTextWarning = { fg = v_text_gray and C.gray1 or warning },
		LspDiagnosticsVirtualTextInformation = { fg = v_text_gray and C.gray1 or info },
		LspDiagnosticsVirtualTextHint = { fg = v_text_gray and C.gray1 or hint },
		LspDiagnosticsUnderlineError = { style = { S.underline }, sp = error }, -- Used to underline "Error" diagnostics
		LspDiagnosticsUnderlineWarning = { style = { S.underline }, sp = warning }, -- Used to underline "Warning" diagnostics
		LspDiagnosticsUnderlineInformation = { style = { S.underline }, sp = info }, -- Used to underline "Information" diagnostics
		LspDiagnosticsUnderlineHint = { style = { S.underline }, sp = hint }, -- Used to underline "Hint" diagnostics
		LspInfoBorder = { link = "FloatBorder" },
	}
end

return M
