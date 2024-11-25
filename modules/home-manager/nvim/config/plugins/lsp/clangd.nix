{
  plugins.clangd-extensions = {
    enable = true;

    # Main configuration settings
    settings = {
      inlay_hints = {
        inline = false;
      };

      ast = {
        # Role icons (requires codicons)
        role_icons = {
          type = "";
          declaration = "";
          expression = "";
          specifier = "";
          statement = "";
          "template argument" = "";
        };

        # Kind icons
        kind_icons = {
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
  };
}
