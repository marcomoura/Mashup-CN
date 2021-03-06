require 'test_helper'

class HomeControllerTest < ActionController::TestCase

	test "html updates" do
	end
	
	test "iphone version" do
	end
	
	test "rjs updates" do
	end

  test "should success access home" do
		get :index
    assert :success
	end

  test "should get last tags" do
		get :index
		assert_not_nil assigns(:data)
  end

  test "should redirect to url in english" do	
#		get :index, {:locale => "en"} #bug not pass locale how parameters, ex: blabal.com/?locale=en 
#		assert_redirected_to "/en"
  end

  test "should have slogan in english" do
		get :index, :locale => "en" 
		assert_select 'p.slogan', "Online coverage of events in New Song"
  end

  test "should have slogan in spanish" do
		get :index, :locale => "es" 
		assert_select 'p.slogan', "L&iacute;nea de cobertura de los acontecimientos en Cancion Nueva"
  end

  test "should link to spanish" do
		get :index, :locale => "es" 
		assert_select 'div#footer a[href=?]' , "/es/"
  end

  test "shoud link to english" do
		get :index, :locale => "en" 
		assert_select 'div#footer a[href=?]' , "/en/"
  end

  test "should redirect from plug4life" do
		@request.host = 'plug4life.com' 
		get :index
		assert_redirected_to "http://mashup.cancaonova.com/"
  end

  test "should render mobile" do
		@request.host = 'cancaonova.mobi' 
		get :index
		assert_template "home/index.xhtml.haml"
  end

  test "should list 10 itens in last updates" do
		get :index
		assert_select "div#spotlight > div",  1..10 
  end

	test "should render page even no analytic data" do
#		get :index # should find a way to turn off google analyitcs
#		assert_select "div#popular li", 0 
	end

# iphone

	test "should render iphone template" do
		get :index , :format => "iphone"
		assert_template "home/index.iphone.haml"
	end

# test rss link_to

	test "should link to rss with default tag" do
		get :index 
		assert_select 'div#footer a.rss[href=?]' , "/cancaonova.rss"
	end

end
