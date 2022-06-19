if executable('rg')
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
  let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
  let g:ctrlp_user_command = 'rg --files'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_switch_buffer = 'et'
endif


