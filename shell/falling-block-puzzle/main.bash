#!/bin/bash
input_piece_face_1=$1
input_piece_face_2=$2
input_piece_face_3=$3
input_piece_face_4=$4
input_piece_face_5=$5
input_piece_face_6=$6
input_piece_face_7=$7

cls() {
  echo -e $'\e[H\e[2J'
}

cursor() {
  echo -e $'\e['$2';'$1'H\c'
}

beep() {
  echo -e $'\a\c'
}

new_screen() {
  echo -e $'\e7\e[?47h\c'
}

exit_screen() {
  echo -e $'\e[?47l\e8'
}

init_tty() {
  new_screen
  cls
}

quit_tty() {
  cls
  exit_screen
}

# random

rand() {
  rand_val=$((RANDOM % 256 * ($3 - $2 + 1) / 256 + $2))
  eval $1=$rand_val
}

# program

init_map() {
  cursor 30 1
  echo -e '┏━━━━━━━━━━━━━━━━━━━━━┓\c'
  for ((i = 2; i <= 23; i++)) {
    cursor 30 $i
    echo -e  '┃                     ┃\c'
  }
  cursor 30 24
  echo -e '┗━━━━━━━━━━━━━━━━━━━━━┛\c'

  cursor 54 1
  echo -e '┌──────────┐'
  cursor 54 2
  echo -e '│   NEXT   │'
  cursor 54 3
  echo -e '└──────────┘'

  cursor 54 4
  echo -e '┌──────────┐'
  for ((i = 5; i <= 10; i++)) {
    cursor 54 $i
    echo -e '│          │'
  }
  cursor 54 11
  echo -e '└──────────┘'

  cursor 54 12
  echo -e '┌──────────┐'
  cursor 54 13
  echo -e '│   SCORE  │'
  cursor 54 14
  echo -e '└──────────┘'

  cursor 54 15
  echo -e '┌──────────┐'
  cursor 54 16
  echo -e '│          │'
  cursor 54 17
  echo -e '└──────────┘'

  cursor 8 10
  echo -e 'ROTATE

       [8][K]
        ┏━┓
        ┃↑┃
LEFT    ┗━┛    RIGHT
    ┏━┓ ┏━┓ ┏━┓
[4] ┃←┃ ┃↓┃ ┃→┃ [6]
[H] ┗━┛ ┗━┛ ┗━┛ [L]
       [J][2]
       [SPACE]

        DROP

[Q] - Quit\c'

  cursor 80 24
  for ((j = 1; j <= 23; j++)) {
    eval map_30_"$j"=NO
    for ((i = 32; i <= 50; i += 2)) {
      eval map_"$i"_"$j"=0
    }
      eval map_52_"$j"=NO
      eval map_54_"$j"=NO
  }

  for ((i = 30; i <= 54; i += 2)) {
    eval map_"$i"_24=NO
  }
}

put_score() {
  cursor 56 16
  printf %8d $1
}

piece_face_0='  '

# 000
#   0
piece_face_1=${input_piece_face_1:-'Ａ'}
piece_xmin_10=34 piece_xmax_10=48
piece_x_101=-1 piece_y_101=0
piece_x_102=1 piece_y_102=0
piece_x_103=1 piece_y_103=1
piece_xmin_11=32 piece_xmax_11=48
piece_x_111=0 piece_y_111=1
piece_x_112=0 piece_y_112=-1
piece_x_113=1 piece_y_113=-1
piece_xmin_12=34 piece_xmax_12=48
piece_x_121=1 piece_y_121=0
piece_x_122=-1 piece_y_122=0
piece_x_123=-1 piece_y_123=-1
piece_xmin_13=34 piece_xmax_13=50
piece_x_131=0 piece_y_131=-1
piece_x_132=0 piece_y_132=1
piece_x_133=-1 piece_y_133=1

# 000
# 0
piece_face_2=${input_piece_face_2:-'Ｂ'}
piece_xmin_20=34 piece_xmax_20=48
piece_x_201=-1 piece_y_201=0
piece_x_202=1 piece_y_202=0
piece_x_203=-1 piece_y_203=1
piece_xmin_21=32 piece_xmax_21=48
piece_x_211=0 piece_y_211=1
piece_x_212=0 piece_y_212=-1
piece_x_213=1 piece_y_213=1
piece_xmin_22=34 piece_xmax_22=48
piece_x_221=1 piece_y_221=0
piece_x_222=-1 piece_y_222=0
piece_x_223=1 piece_y_223=-1
piece_xmin_23=34 piece_xmax_23=50
piece_x_231=0 piece_y_231=-1
piece_x_232=0 piece_y_232=1
piece_x_233=-1 piece_y_233=-1

#  00
# 00
piece_face_3=${input_piece_face_3:-'Ｃ'}
piece_xmin_30=34 piece_xmax_30=48
piece_x_301=-1 piece_y_301=1
piece_x_302=1 piece_y_302=0
piece_x_303=0 piece_y_303=1
piece_xmin_31=32 piece_xmax_31=48
piece_x_311=1 piece_y_311=1
piece_x_312=0 piece_y_312=-1
piece_x_313=1 piece_y_313=0
piece_xmin_32=34 piece_xmax_32=48
piece_x_321=-1 piece_y_321=1
piece_x_322=1 piece_y_322=0
piece_x_323=0 piece_y_323=1
piece_xmin_33=32 piece_xmax_33=48
piece_x_331=1 piece_y_331=1
piece_x_332=0 piece_y_332=-1
piece_x_333=1 piece_y_333=0

# 00
#  00
piece_face_4=${input_piece_face_4:-'Ｄ'}
piece_xmin_40=34 piece_xmax_40=48
piece_x_401=-1 piece_y_401=0
piece_x_402=1 piece_y_402=1
piece_x_403=0 piece_y_403=1
piece_xmin_41=32 piece_xmax_41=48
piece_x_411=0 piece_y_411=1
piece_x_412=1 piece_y_412=-1
piece_x_413=1 piece_y_413=0
piece_xmin_42=34 piece_xmax_42=48
piece_x_421=-1 piece_y_421=0
piece_x_422=1 piece_y_422=1
piece_x_423=0 piece_y_423=1
piece_xmin_43=32 piece_xmax_43=48
piece_x_431=0 piece_y_431=1
piece_x_432=1 piece_y_432=-1
piece_x_433=1 piece_y_433=0


# 000
#  0
piece_face_5=${input_piece_face_5:-'Ｅ'}
piece_xmin_50=34 piece_xmax_50=48
piece_x_501=-1 piece_y_501=0
piece_x_502=1 piece_y_502=0
piece_x_503=0 piece_y_503=1
piece_xmin_51=32 piece_xmax_51=48
piece_x_511=0 piece_y_511=1
piece_x_512=0 piece_y_512=-1
piece_x_513=1 piece_y_513=0
piece_xmin_52=34 piece_xmax_52=48
piece_x_521=1 piece_y_521=0
piece_x_522=-1 piece_y_522=0
piece_x_523=0 piece_y_523=-1
piece_xmin_53=34 piece_xmax_53=50
piece_x_531=0 piece_y_531=-1
piece_x_532=0 piece_y_532=1
piece_x_533=-1 piece_y_533=0


# 0000
#
piece_face_6=${input_piece_face_6:-'Ｆ'}
piece_xmin_60=34 piece_xmax_60=46
piece_x_601=-1 piece_y_601=0
piece_x_602=1 piece_y_602=0
piece_x_603=2 piece_y_603=0
piece_xmin_61=32 piece_xmax_61=50
piece_x_611=0 piece_y_611=-1
piece_x_612=0 piece_y_612=1
piece_x_613=0 piece_y_613=2
piece_xmin_62=34 piece_xmax_62=46
piece_x_621=-1 piece_y_621=0
piece_x_622=1 piece_y_622=0
piece_x_623=2 piece_y_623=0
piece_xmin_63=32 piece_xmax_63=50
piece_x_631=0 piece_y_631=-1
piece_x_632=0 piece_y_632=1
piece_x_633=0 piece_y_633=2


# 00
# 00
piece_face_7=${input_piece_face_7:-'Ｇ'}
piece_xmin_70=32 piece_xmax_70=48
piece_x_701=1 piece_y_701=0
piece_x_702=1 piece_y_702=1
piece_x_703=0 piece_y_703=1
piece_xmin_71=32 piece_xmax_71=48
piece_x_711=1 piece_y_711=0
piece_x_712=1 piece_y_712=1
piece_x_713=0 piece_y_713=1
piece_xmin_72=32 piece_xmax_72=48
piece_x_721=1 piece_y_721=0
piece_x_722=1 piece_y_722=1
piece_x_723=0 piece_y_723=1
piece_xmin_73=32 piece_xmax_73=48
piece_x_731=1 piece_y_731=0
piece_x_732=1 piece_y_732=1
piece_x_733=0 piece_y_733=1



put_piece() {
  eval piece_face=\$piece_face_$3
  cursor $1 $2
  echo -e "$piece_face\c"

  for i in 1 2 3; do
    eval px=\$piece_x_$3$4$i py=\$piece_y_$3$4$i
    px=$(($1 + px * 2))
    py=$(($2 + py))
    cursor $px $py
    echo -e "$piece_face\c"
  done
}

remove_piece() {
  cursor $1 $2
  echo -e '  \c'
  for i in 1 2 3; do
    eval px=\$piece_x_$3$4$i py=\$piece_y_$3$4$i
    px=$(($1 + px * 2))
    py=$(($2 + py))
    cursor $px $py
    if ((py >= 2)); then
      echo -e '  \c'
    else
      echo -e '━━\c'
    fi
  done
}

check_piece() {
  eval i=\$piece_xmin_$3$4
  if (($1 < i)); then
    echo 2
    return
  fi
  eval i=\$piece_xmax_$3$4
  if (($1 > i)); then
    echo -2
    return
  fi
  eval pm=\$map_"$1"_"$2"
  if [ $pm != 0 ]; then
    echo NO
    return
  fi
  for i in 1 2 3; do
    eval px=\$piece_x_$3$4$i py=\$piece_y_$3$4$i
    px=$(($1 + px * 2))
    py=$(($2 + py))
    eval pm=\$map_"$px"_"$py"
    if [ $pm != 0 ]; then
      echo NO
      return
    fi
  done

  echo 0
}

put_piece_map() {
  eval map_"$1"_"$2"=$3
  for i in 1 2 3; do
    eval px=\$piece_x_$3$4$i py=\$piece_y_$3$4$i
    px=$(($1 + px * 2))
    py=$(($2 + py))
    eval map_"$px"_"$py"=$3
  done
}

clear_line() {
  for ((j = $1; j >= 2; j--)) {
    jj=$((j - 1))
    cursor 32 $j
    line=
    for ((i = 32; i <= 50; i += 2)) {
      eval pm=\$map_"$i"_"$jj"
      eval map_"$i"_"$j"=$pm
      eval piece_face=\$piece_face_$pm
      line=$line$piece_face
    }
  echo -e "$line\c"
  }

  cursor 32 1
  for ((i = 32; i <= 50; i += 2)) {
    eval map_"$i"_1=0
  }
  echo -e $'━━━━━━━━━━━━━━━━━━━━'
}

check_one_line() {
  for ((px = 32; px <= 50; px += 2)) {
    eval pm=\$map_"$px"_"$1"
    if [ $pm = 0 ]; then
      return 1
    fi
  }
  return 0
}

check_line() {
  py=$(($1 - 1))
  py_max=$(($1 + 2))
  if ((py_max > 23)); then
    py_max=23
  fi

  line_score=0
  for ((; py <= py_max; py++)) {
    if check_one_line $py; then
      beep
      line_score=$((line_score * 2 + 100))
      clear_line $py
    fi
  }

  if ((line_score >= 0)); then
    ((score += line_score))
    put_score $score
  fi
}

####################################################

# main
trap '' INT QUIT TSTP

init_tty
init_map

x=40 y=2 dir=0
old_x=$x old_y=$y old_dir=$dir
rand piece 1 7
draw=1

rand next_piece 1 7
put_piece 58 7 $next_piece 0
score=0
put_score $score

old_sec=$SECONDS

while true ; do
  if [ "$draw" ]; then
    draw=
    remove_piece $old_x $old_y $piece $old_dir
    put_piece $x $y $piece $dir
    old_x=$x old_y=$y old_dir=$dir
    cursor 80 24
  fi
  key=timeout
  if [ $SECONDS = $old_sec ]; then
    IFS= read -s -n 1 -t  1 key
  fi
  case "$key" in
    timeout)
      old_sec=$SECONDS
      ((y++))
      if [ `check_piece $x $y $piece $dir` != 0 ]; then
        y=$old_y
        put_piece_map $x $y $piece $dir
        check_line $y

        x=40 y=2 dir=0
        old_x=$x old_y=$y old_dir=$dir
        piece=$next_piece
        remove_piece 58 7 $next_piece 0
        rand next_piece 1 7
        put_piece 58 7 $next_piece 0
        if [ `check_piece $x $y $piece $dir` != 0 ]; then
          put_piece $x $y $piece $dir
          cursor 1 1
          echo -e 'Game Over\nHit [Q] to quit...\c'
          while true; do
            IFS= read -s -n 1 key
            case "$key" in
              q|Q)
                break
                ;;
            esac
          done
          break
        fi
      fi
      draw=1
      ;;
    q|Q)
      break
      ;;
    h|D|4)
      ((x -= 2))
      if [ `check_piece $x $y $piece $dir` != 0 ]; then
        x=$old_x
      else
        draw=1
      fi
      ;;
    l|C|6)
      ((x += 2))
      if [ `check_piece $x $y $piece $dir` != 0 ]; then
        x=$old_x
      else
        draw=1
      fi
      ;;
    j|B|2|' ')
      remove_piece $old_x $old_y $piece $old_dir
      while
        ((y++))
       [ `check_piece $x $y $piece $dir` = 0 ]; do
        cursor $x $y
      done
      ((y--))
      put_piece $x $y $piece $dir
      ((score += y - old_y))
      old_x=$x old_y=$y old_dir=$dir
      put_score $score
      cursor 80 24
      ;;
    k|A|8)
      ((dir = (dir + 1) % 4))
      while true; do
        mod_x=`check_piece $x $y $piece $dir`
        case $mod_x in
          NO)
            dir=$old_dir
            break
            ;;
          0)
            draw=1
            break
            ;;
          *)
            ((x += mod_x))
            ;;
        esac
      done
      ;;
  esac
done

quit_tty
exit
