echo "Clean dependencies and generated application files"
echo "mix clean; mix deps.clean --all"
mix clean; mix deps.clean --all;
echo "Download dependencies and compile"
echo "mix deps.get; mix compile"
mix deps.get; mix compile;
echo "Run main"
mix run -e "TSCProject.main()"

