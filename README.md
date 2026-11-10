# Aegis distributions

This repository distributes releases of Aegis products, including release downloads and installation metadata. See [Releases](https://github.com/bradodarb/aegis-dist/releases) for available versions.

## Aegis Hub

Connect Aegis agents to your Slack workspace.

Supported platforms: macOS on Apple silicon.

### Install and upgrade

```sh
brew tap bradodarb/aegis-dist https://github.com/bradodarb/aegis-dist
if brew commands | grep -qx trust; then brew trust bradodarb/aegis-dist; fi
brew install bradodarb/aegis-dist/aegis-hub
brew upgrade bradodarb/aegis-dist/aegis-hub
```

### Using it

```sh
brew services start aegis-hub
brew upgrade bradodarb/aegis-dist/aegis-hub
brew services restart aegis-hub
```

[Public releases](https://github.com/bradodarb/aegis-dist/releases?q=hub-v)

## Aegis TUI

Work with Aegis AI agents in your terminal.

Supported platforms: macOS on Apple silicon.

### Install and upgrade

```sh
brew tap bradodarb/aegis-dist https://github.com/bradodarb/aegis-dist
if brew commands | grep -qx trust; then brew trust bradodarb/aegis-dist; fi
brew install bradodarb/aegis-dist/aegis
brew upgrade bradodarb/aegis-dist/aegis
```

### Using it

```sh
aegis --help
aegis /path/to/project
```

[Public releases](https://github.com/bradodarb/aegis-dist/releases?q=v)

## Slack setup for Aegis Hub

Create an app at https://api.slack.com/apps using **From a manifest**, select your
workspace, and import this YAML:

```yaml
display_information:
  name: Aegis Hub
features:
  bot_user:
    display_name: Aegis Hub
    always_online: true
  slash_commands:
    - command: /aegis
      description: Talk to Aegis
      usage_hint: help
      should_escape: false
oauth_config:
  scopes:
    bot:
      - app_mentions:read
      - chat:write
      - commands
      - channels:history
      - groups:history
      - files:write
settings:
  event_subscriptions:
    bot_events:
      - app_mention
      - message.channels
      - message.groups
  interactivity:
    is_enabled: true
  socket_mode_enabled: true
  org_deploy_enabled: false
  token_rotation_enabled: false
```

In Basic Information, generate an app-level token with connections:write.
Install the app to your workspace under OAuth & Permissions and copy the bot
token. Reinstall the app whenever you change scopes. Invite the app to every
channel it should use, including private channels. Copy each allowed person's
member ID from their Slack profile; use comma-separated IDs for multiple users.

Create the trusted per-user shell configuration, replacing the placeholders locally:

```sh
umask 077
mkdir -p "$HOME/.config/aegis-hub"
cat > "$HOME/.config/aegis-hub/env" <<'ENV'
SLACK_BOT_TOKEN='YOUR_BOT_TOKEN'
SLACK_APP_TOKEN='YOUR_APP_TOKEN'
AEGIS_COLLAB_ALLOWED_USERS='YOUR_MEMBER_ID'
ENV
chmod 600 "$HOME/.config/aegis-hub/env"
brew services start aegis-hub
```

Installation and upgrades do not start the service or change this file.
Run services as your login user so they read your HOME configuration.

```sh
brew services stop aegis-hub
brew upgrade bradodarb/aegis-dist/aegis-hub
brew services restart aegis-hub
tail -f "$(brew --prefix)/var/log/aegis-hub.log" "$(brew --prefix)/var/log/aegis-hub-error.log"
```

After editing the environment file, restart the service to reload it.
A readable regular env file and all three nonempty settings are required.
For configuration errors, check the file path, permissions and named missing
setting; do not paste tokens into logs or support messages. If Slack stays silent,
check both tokens, app installation, channel invitation and allowed member IDs.

## License

Aegis products are proprietary software, not open source. They are currently available to use without a license fee for personal use and internal business use, subject to the [Aegis Proprietary Software License](LICENSE).

You may not redistribute, resell, sublicense, embed, or bundle Aegis products in other products or services, or reverse engineer them, except where applicable law prohibits such a restriction. Download availability does not grant access to source code or any open-source rights.

Future releases may have different pricing or license terms. Third-party components remain subject to their own licenses and notices.
