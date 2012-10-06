
cd `dirname $0`
echo '-- start watching'

jade -O page/ -w src/*jade &
stylus -o page/ -w src/*styl &
doodle src/ docs/ &

read

pkill -f jade
pkill -f stylus
pkill -f doodle

echo '-- stop watching'