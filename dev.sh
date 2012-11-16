
cd `dirname $0`
subl -a .

echo '-- start watching'

coffee -o page/ -w src/*coffee &
jade -O page/ -w src/*jade &
stylus -o page/ -w src/*styl &
doodle src/ docs/ &

read

pkill -f coffee
pkill -f jade
pkill -f stylus
pkill -f doodle

echo '-- stop watching'