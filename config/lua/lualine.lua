-- One Dark Pro Colors
 local colors = {
   white = '#ffffff',
   red = '#e06c75',
   grey = '#abb2bf',
   gray = '#495254',
   black = '#323844',
   transparent = '#282c34',
   green = '#98c379',
   yellow = '#e5c07b',
   blue = '#61afef',
   magenta = '#c678dd',
   cyan = '#56b6c2',
   orange = '#ff8700',
 }
--
 local onedarkpro = {
   normal = {
     a = { fg = colors.grey, bg = colors.black  },
     b = { fg = colors.grey,  bg = colors.black  },
     c = { fg = colors.gray, bg = colors.transparent  },
     z = { fg = colors.grey, bg = colors.black  },
   },
   insert = { a = { fg = colors.transparent, bg = colors.yellow  }  },
   visual = { a = { fg = colors.transparent, bg = colors.green  }  },
   replace = { a = { fg = colors.transparent, bg = colors.green  }  },
 }

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

local function process_sections(sections)
	  for name, section in pairs(sections) do
		      local left = name:sub(9, 10) < 'x'
		          for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
				        table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.transparent  }  })
					    end
					        for id, comp in ipairs(section) do
							      if type(comp) ~= 'table' then
								              comp = { comp  }
									              section[id] = comp
									      end
									      comp.separator = left and { right = ''  } or { left = ''  }
									          end
										    end
										      return sections
									      end

									      local function search_result()
										        if vim.v.hlsearch == 0 then
												    return ''
												      end
												        local last_search = vim.fn.getreg('/')
													  if not last_search or last_search == '' then
														      return ''
														        end
															  local searchcount = vim.fn.searchcount { maxcount = 9999  }
															    return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
														    end

														    local function modified()
															      if vim.bo.modified then
																          return '+'
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return '-'
  end
    return ''
end

vim.g.gitblame_display_virtual_text = 0
local git_blame = require('gitblame')


require('lualine').setup {
	options = {
	    theme = onedarkpro,
	    component_separators = '',
	    globalstatus = false,
	},
	sections = process_sections {
		    lualine_a = { 'mode'  },
		    lualine_b = {
			          'branch',  
				        { 'filename', file_status = false, path = 3  },
					{
						        'diagnostics',
							        source = { 'intelephense', 'quick-lint-js'  },
								        sections = { 'error'  },
									        diagnostics_color = { error = { bg = colors.red, fg = colors.white  }  },
										      
					},
					{
						        'diagnostics',
							        source = { 'intelephense', 'quick-lint-js'  },
								        sections = { 'warn'  },
									        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white  }  },
										      
					},
					{
						        'diagnostics',
							        source = { 'intelephense', 'tsserver'  },
								        sections = { 'hint'  },
									        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white  }  },
										      
					},
					      { modified, color = { fg = colors.transparent, bg = colors.green  }  },
					          
		    },
		        lualine_c = {'aerial' },
			    lualine_x = {{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available   }},
			        lualine_y = { search_result, 'filetype'  },
				    lualine_z = { '%l:%c', '%p%%/%L'  },
				      
	},
	inactive_sections = {
		    lualine_c = { '%f %y %m'  },
		        lualine_x = {},
			  
	},
}
