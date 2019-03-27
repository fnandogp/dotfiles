""""""""""
" Python "
""""""""""
" Check Python files with flake8 and pylint.
let g:ale_linters['python'] = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let g:ale_fixers['python'] = ['autopep8', 'yapf']
