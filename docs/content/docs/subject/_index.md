---
weight: 1
bookFlatSection: true
title: "Flowchart"
---

# Flowchart

Below is my fully setup steps in workflow. Sadly, my workflow is not enough perfect, so it could not be a one-click installation. Even though it was not good as I expect, I still want to make it **reusable** and system **consistency**.

{{<mermaid align="left">}}
graph TD
  A{Mac?} --> |Mac| B("Mac Manual Setup (Pre-processing)")
  A{Mac?} --> |Linux| C("Linux Manual Setup (Pre-processing)")
  B --> D(git clone env-setup-workflow)
  C --> D
  D --> E(rename_hostname.sh)
  E --> F("init_global_python_env.sh (consider use pipx instead)")
  F --> G(init zsh)
  subgraph phase1.sh
  G --> H("install homebrew | linuxbrew")
  H --> I(brew bundle install)
  I --> |Linux| J(install linuxbrew not supported packages ex. unar<br>and setup linux security setting)
  J --> K(install fzf keybinding, vim-plug, cheat.sh)
  I --> K
  end
  subgraph phase2.sh
  K --> |Mac, after dropbox was manual synced| L(mackup restore)
  K --> |Linux| M(chezmoi init --apply CaptainVincent &<br>relink symbolic link)
  L --> N(Install vim plugins)
  M --> N
  end
  N --> |Mac| O("Mac Manual Setup (Post-processing)")
  N --> |Linux| P("Linux Manual Setup (Post-processing)")
{{< /mermaid >}}
