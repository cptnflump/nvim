This is a repo for my nvim config, a few things will be needed first 

Iterm2 installed 
brew installed 


then run 

brew install neovim 
brew install tree-sitter
brew install ripgrep 
brew install universal-ctags
brew install font-hack-nerd-font

then run 

gem install debug 
gem install solargraph
gem install solargraph-rails 
gem install rubocop -- THIS MIGHT NOT BE NEEDED?
gem install rubocop-rails -- THIS MIGHT NOT BE NEEDED?
gem install ruby-lsp 

then run 

solargraph scan 

If you would like to have a functioning LLM install, you will need to run: 

brew install ollama
ollama pull deepseek-r1:14b 
