EXEC=$1
TMP_OUT=$2

RED="\033[31m"
GREEN="\033[32m"

for i in {1..10..1}; do
  testname=$(printf "%01d" $i)
  $EXEC < tests/$testname.in > $TMP_OUT
  if ! diff -qwB tests/$testname.out $TMP_OUT &>/dev/null; then
    echo -e "${RED}Test $testname failed!"
  else
    echo -e "${GREEN}Test $testname passed!"
  fi
done
rm $TMP_OUT