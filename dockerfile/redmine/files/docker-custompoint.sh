STARTPAGE_DIR="/usr/src/redmine/plugins/redmine_startpage"
MINELAB_DIR="/usr/src/redmine/public/themes/minelab";
SLACK_DIR="/usr/src/redmine/plugins/redmine_slack";
GITHUB_DIR="/usr/src/redmine/plugins/redmine_github_hook";
AGILE_DIR="/usr/src/redmine/plugins/redmine_agile";

#minelab theme
if [ ! -d "$MINELAB_DIR" ]
then
    git clone https://github.com/hardpixel/minelab.git $MINELAB_DIR
fi

#startpage
if [ ! -d "$STARTPAGE_DIR" ]
then
    git clone https://github.com/sciyoshi/redmine-slack.git $STARTPAGE_DIR
fi

#slack
if [ ! -d "$SLACK_DIR" ]
then
    git clone https://github.com/sciyoshi/redmine-slack.git $SLACK_DIR
fi

#github
if [ ! -d "$GITHUB_DIR" ]
then
    git clone https://github.com/koppen/redmine_github_hook.git $GITHUB_DIR
fi

#agile
if [ ! -d "$AGILE_DIR" ]
then
    bundle lock --add-platform java
    bundle lock --add-platform x86-mingw32 x64-mingw32 x86-mswin32 java
    wget -O redmine_agile.zip http://email.redmineup.com/c/eJxFzrFuwzAMBNCvkceAEiVSHjQUKPIbgSRSjVtbCRyn_v04U4Cb3nB3kloYI5ZhSiFKFHbADuXSyFnQygQBfA3Gw6qyTF2f99OSp3m4Ji6-2Tg2gCKFYkYmpeqLFQkkOA5zum7b3eCXcecj-76fPiX1thw2T1X7Qy9L7vlH10OQwVuD5-
32p93gN6COpEUzOG1RHAFrqXyoQqicHUVrhzVJ_33IU8DC-2zP_7q-N15SxkPr
    unzip redmine_agile.zip -d /usr/src/redmine/plugins
fi

bundle install --without development test
rake redmine:plugins:migrate RAILS_ENV=production
