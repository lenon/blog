require "spec_helper"

describe Post do
  it { should respond_to :title }
  it { should respond_to :content }
  it { should respond_to :slug }
  it { should respond_to :published }

  it "should not be saved" do
    Post.new.save.should be_false
  end

  it "should be created" do
    Post.create!({
      :title => "Foo",
      :content => "Bar"
    }).should be_true
  end

  it "must have a title" do
    Post.new({
      :content => "bla"
    }).should_not be_valid
  end

  it "must have content" do
    Post.new({
      :title => "foo"
    }).should_not be_valid
  end

  it "must have a unique slug" do
    first = Post.create!({
      :title => "foo",
      :content => "bar"
    })

    second = Post.create!({
      :title => "foo",
      :content => "bar"
    })

    first.slug.should_not == second.slug
  end

  it "saves an unpublished Post" do
    expect {
      Post.create!({
        :title => "teste",
        :content => "foobarbaz",
        :published => false
      })
    }.to_not raise_error
  end
end
