{
  plugins.clangd-extensions = {
    enable = true;

    # Use inlayHints for inlay hints configuration
    inlayHints = {
      enable = true;
      inline = false;
    };

    # Use ast configuration directly
    ast = {
      # Role icons (requires codicons)
      roleIcons = {
        type = "";
        declaration = "";
        expression = "";
        specifier = "";
        statement = "";
        "template argument" = "";
      };

      # Kind icons
      kindIcons = {
        Compound = "";
        Recovery = "";
        TranslationUnit = "";
        PackExpansion = "";
        TemplateTypeParm = "";
        TemplateTemplateParm = "";
        TemplateParamObject = "";
      };
    };
  };
}
