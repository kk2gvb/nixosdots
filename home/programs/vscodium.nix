{ lib, pkgs, pkgs-unstable, user, ... }:

{
  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium.fhs; # Включает VSCodium/VS Code с поддержкой плагинов
    
    profiles.default = {
      userSettings = {
        # Шрифт и размеры
        # "editor.fontFamily" = lib.mkForce "'JetBrains Mono', 'bold', bold";
        # "editor.fontSize" = 12;

        # Иконки и оформление
        "workbench.iconTheme" = "material-icon-theme";
        "material-icon-theme.hidesExplorerArrows" = true;
        "workbench.tree.indent" = 14;

        "notifications.enabled" = true;
        "workbench.colorTheme" = "Kanagawa Dragon";

        # Нумерация строк и подтверждения
        "editor.lineNumbers" = "relative";
        "explorer.confirmDragAndDrop" = true;
        "explorer.confirmDelete" = true;

        # Скроллбары и минимапа
        "editor.scrollbar.horizontal" = "hidden";
        "editor.scrollbar.vertical" = "hidden";
        "editor.minimap.enabled" = false;
        "editor.matchBrackets" = "never";
        "editor.occurrencesHighlight" = "off";
        "editor.overviewRulerBorder" = false;
        "editor.hideCursorInOverviewRuler" = true;
        "editor.stickyScroll.enabled" = false;

        "workbench.colorCustomizations" = {
          "editorCursor.background" = "#000000";
          "editorOverviewRuler.wordHighlightStrongForeground" = "#0000";
          "editorOverviewRuler.selectionHighlightForeground" = "#0000";
          "editorOverviewRuler.rangeHighlightForeground" = "#0000";
          "editorOverviewRuler.wordHighlightForeground" = "#0000";
          "editorOverviewRuler.bracketMatchForeground" = "#0000";
          "editorOverviewRuler.findMatchForeground" = "#0000";
          "editorOverviewRuler.modifiedForeground" = "#0000";
          "editorOverviewRuler.deletedForeground" = "#0000";
          "editorOverviewRuler.warningForeground" = "#0000";
          "editorOverviewRuler.addedForeground" = "#0000";
          "editorOverviewRuler.errorForeground" = "#0000";
          "editorOverviewRuler.infoForeground" = "#0000";
          "editorOverviewRuler.border" = "#0000";
        };

        # Интерфейс
        "breadcrumbs.enabled" = false;
        "workbench.statusBar.visible" = true;

        # Курсор и заголовок
        "editor.multiCursorModifier" = "ctrlCmd";
        "editor.cursorBlinking" = "solid";
        "chat.commandCenter.enabled" = false;
        "workbench.layoutControl.enabled" = false;
        "window.customTitleBarVisibility" = "never";
        "window.titleBarStyle" = "native";
        "window.menuBarVisibility" = "toggle";

        # Декорации
        "explorer.decorations.badges" = false;
        "git.decorations.enabled" = false;
        "scm.diffDecorations" = "none";

        # Плагины и подсказки
        "todohighlight.isEnable" = true;
        "workbench.startupEditor" = "none";
        "editor.parameterHints.enabled" = false;
        "files.trimTrailingWhitespace" = false;
        "editor.links" = false;

        # Табы и форматирование
        "editor.tabSize" = 4;
        "files.insertFinalNewline" = true;
        "workbench.tips.enabled" = false;
        "workbench.tree.enableStickyScroll" = false;
        "workbench.tree.renderIndentGuides" = "none";
        "editor.detectIndentation" = false;
        "editor.showFoldingControls" = "never";
        "editor.guides.indentation" = false;
        "editor.renderWhitespace" = "none";
        "editor.renderLineHighlight" = "none";
        "files.autoSave" = "afterDelay";

        # Обновления и рекомендации
        "update.mode" = "none";
        "extensions.ignoreRecommendations" = true;

        # Динамический путь к clangd с использованием переменной user.homeDir
        "clangd.path" = "${user.homeDir}/.config/VSCodium/User/globalStorage/kylinideteam.kylin-clangd/install/19.1.2/clangd_19.1.2/bin/clangd";
      };

      extensions = with pkgs.vscode-extensions; [
        pkief.material-icon-theme
        bbenoist.nix
        ms-python.python
        ms-python.mypy-type-checker
        ms-python.debugpy
        ms-python.vscode-python-envs
	    formulahendry.code-runner
        llvm-vs-code-extensions.vscode-clangd
      ];
    };
  };
}
