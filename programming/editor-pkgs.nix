{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nixd
    pkgs.nixfmt
    lua-language-server
    luarocks
    luaPackages.tree-sitter-cli
  ];
}
