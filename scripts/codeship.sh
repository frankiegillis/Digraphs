echo "=========================================================="
echo "GAP DEV: Running tests with Semigroups and Grape loaded..."
echo "=========================================================="
echo "LoadPackage(\"digraphs\"); LoadPackage(\"semigroups\"); DigraphsTestAll(); DigraphsTestExtreme(); quit;" | sh gap/bin/gap.sh | tee testlog.txt
echo "================================================================"
echo "GAP DEV: Running tests with Grape loaded (but NOT Semigroups)..."
echo "================================================================"
echo "LoadPackage(\"digraphs\"); DigraphsTestAll(); DigraphsTestExtreme(); quit;" | sh gap/bin/gap.sh | tee -a testlog.txt
rm -r gap/pkg/grape
echo "================================================================"
echo "GAP DEV: Running tests with Semigroups loaded (but NOT Grape)..."
echo "================================================================"
echo "LoadPackage(\"digraphs\"); LoadPackage(\"semigroups\"); DigraphsTestAll(); DigraphsTestExtreme(); quit;" | sh gap/bin/gap.sh | tee -a testlog.txt
echo "============================================================"
echo "GAP DEV: Running tests WITHOUT Semigroups or Grape loaded..."
echo "============================================================"
echo "LoadPackage(\"digraphs\"); DigraphsTestAll(); DigraphsTestExtreme(); quit;" | sh gap/bin/gap.sh | tee -a testlog.txt

echo "=========================================================="
echo "GAP 4.8: Running tests with Semigroups and Grape loaded..."
echo "=========================================================="
echo "LoadPackage(\"digraphs\"); LoadPackage(\"semigroups\"); DigraphsTestAll(); DigraphsTestExtreme(); quit;" | sh gap4r8/bin/gap.sh | tee -a testlog.txt
echo "================================================================"
echo "GAP 4.8: Running tests with Grape loaded (but NOT Semigroups)..."
echo "================================================================"
echo "LoadPackage(\"digraphs\"); DigraphsTestAll(); DigraphsTestExtreme(); quit;" | sh gap4r8/bin/gap.sh | tee -a testlog.txt
rm -r gap4r8/pkg/grape
echo "================================================================"
echo "GAP 4.8: Running tests with Semigroups loaded (but NOT Grape)..."
echo "================================================================"
echo "LoadPackage(\"digraphs\"); LoadPackage(\"semigroups\"); DigraphsTestAll(); DigraphsTestExtreme(); quit;" | sh gap4r8/bin/gap.sh | tee -a testlog.txt
echo "============================================================"
echo "GAP 4.8: Running tests WITHOUT Semigroups or Grape loaded..."
echo "============================================================"
echo "LoadPackage(\"digraphs\"); DigraphsTestAll(); DigraphsTestExtreme(); quit;" | sh gap4r8/bin/gap.sh | tee -a testlog.txt

grep --colour=always -A 1 -E "########> Diff|$" testlog.txt ; ( ! grep -E "########> Diff" testlog.txt )
