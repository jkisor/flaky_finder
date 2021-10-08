# require "./lib/flaky_finder/run"

# describe FlakyFinder::Run do

#   subject { FlakyFinder::Run.new(examples) }

#   let(:examples) do
#     [
#       {
#         "file_path" => "./path/to/file",
#         "line_number" => 123,
#         "status" => "passed"
#       }
#     ]
#   end

#   it do
#     subject.to_gh
#     def to_h
#       @examples.map { |e| [ e.key, e.status ] }.to_h
#     end
#     expect(subject.key).to eq("./path/to/file:123")
#     expect(subject.status).to eq("passed")
#   end

# end