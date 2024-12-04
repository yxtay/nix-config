{ lib, user, ... }: {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  programs = {
    git = {
      enable = true;
      lfs.enable = true;

      userName = user.name;
      userEmail = user.email;

      includes = [
        {
          condition = "gitdir:~/git/work/";
          contents = {
            user.email = user.workEmail;
          };
        }
      ];

      extraConfig = {
        commit.verbose = true;
        diff = {
          algorithm = "histogram";
          colorMoved = "default";
        };
        help.autocorrect = 20;
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
        rebase= {
          autosquash = true;
          autostash = true;
        };

        filter = {
          "lfs" = {
            clean = "git-lfs clean -- %f";
            process = "git-lfs filter-process";
            required = true;
            smudge = "git-lfs smudge -- %f";
          };
        };
        
        url = {
          "git@github.com:" = {
            insteadOf = "https://github.com/";
          };
        };

        # fsckobjects
        fetch.fsckobjects = true;
        receive.fsckobjects = true;
        transfer.fsckobjects = true;

        # submodule
        diff.submodule = "log";
        status.submoduleSummary = true;
        submodule.recurse = true;
      };

      aliases = {
        d = "diff";
        f = "fetch";
        p = "push";
        r = "reset";
        s = "status";
        br = "branch";
        ca = "commit -am";
        cm = "commit -m";
        co = "checkout";
        dc = "diff --cached";
        ds = "diff --stat";
        gl = "config --global -l";
        st = "status";
        ll = "log --oneline";
        rh = "reset --hard";
        rs = "reset --soft HEAD~1";
        rv = "remote -v";
        sw = "switch";

        aliases = "config --get-regexp alias";
        amend = "commit --amend -m";
        last = "log -1 HEAD --stat";
        unadd = "restore --staged";
        undo = "reset HEAD~1 --mixed";
        untrack = "rm --cached";

        update = "submodule update --init --recursive";
        foreach = "submodule foreach";
      };

      delta = {
        enable = true;
        options = {
          dark = true;
          line-numbers = true;
          hyperlinks = true;
          hyperlinks-file-link-format = "vscode://file/{path}:{line}";
          navigate = true;
          side-by-side = true;
        };
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings.git_protocol = "ssh";
    };
  };
}
