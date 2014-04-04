#!/bin/sh -e
# upstart-job
#
# Symlink target for initscripts that have been converted to Upstart.
 
set -e

USER="www-data"
RVM="/usr/local/rvm/bin/rvm"
GEM_SET="2.0.0@gart360"
GEM_HOME="/usr/local/rvm/gems/ruby-$GEM_SET"
APP_ROOT="/var/www/gart360/current"
SET_PATH="cd $APP_ROOT && $RVM use $GEM_SET; export GEM_HOME=$GEM_HOME"

PID="/var/www/gart360/shared/solr/pids/staging/sunspot-solr-staging.pid"
ENV="staging"
 
start_sunspot(){
    echo "Starting Sunspot"
    su - $USER -c "$SET_PATH && $RVM $GEM_SET exec bundle exec rake sunspot:solr:start RAILS_ENV=$ENV --trace"
    echo "Sunspot Started"
}
 
stop_sunspot(){
    echo "Stopping Sunspot"
    su - $USER -c "$SET_PATH && $RVM $GEM_SET exec bundle exec rake sunspot:solr:stop RAILS_ENV=$ENV --trace"
    echo "Sunspot Stopped"
}
 
COMMAND="$1"
shift
 
case $COMMAND in
status)
    ;;
start|stop|restart)
    $ECHO
    if [ "$COMMAND" = "stop" ]; then
        stop_sunspot
    elif [ "$COMMAND" = "start" ]; then
        start_sunspot
    elif  [ "$COMMAND" = "restart" ]; then
        stop_sunspot
        sleep 1s
        start_sunspot
        exit 0
    fi
    ;;
esac