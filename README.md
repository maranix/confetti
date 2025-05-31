# CONFETTI  🎉

> Configs 🛠️ + Spagetti 🍝 

## TBD: Finish below section

### Sub Heading

---

#### Obsidian Automated Sync Service

#### Customize (TBD):

#### Setup:
###### 1. macOS

```bash
ln -s $HOME/confetti/com.obsidian.sync $HOME/Library/LaunchAgents/
```

```bash
launchctl bootstrap gui/$(id -u) $HOME/Library/LaunchAgents/com.obsidian.sync.plist
```

```bash
launchctl kickstart -kp gui/$(id -u)/com.obsidian.sync
```
###### 2. Linux

#### Remove:

###### 1. macOS: 
```bash
launchctl bootout gui/$(id -u)/com.obsidian.sync
```