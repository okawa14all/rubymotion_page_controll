class MainController < UIViewController

  def viewDidLoad
    super

    self.edgesForExtendedLayout = UIRectEdgeNone

    rmq.stylesheet = MainStylesheet
    rmq(self.view).apply_style :root_view

    @scrollView = rmq.append(UIScrollView, :scroll_view).get
    @scrollView.delegate = self
    self.view.addSubview(@scrollView)

    rmq(@scrollView).tap do |v|
      v.append(UILabel, :page_1)
      v.append(UILabel, :page_2)
      v.append(UILabel, :page_3)
    end

    @pageControl = rmq.append(UIPageControl, :page_controll).get
    self.view.addSubview(@pageControl)
    @pageControl.userInteractionEnabled = true
    rmq(@pageControl).on(:touch) do |sender|
      pageControlTapped
    end

    rmq(self.view).append(UIButton, :some_button).on(:touch) do |sender|
      puts 'button tapped'
    end

  end

  def viewWillAppear(animated)
    self.navigationController.setNavigationBarHidden(true, animated: true)
  end

  def pageControlTapped
    frame = @scrollView.frame
    frame.origin.x = frame.size.width * @pageControl.currentPage
    @scrollView.scrollRectToVisible(frame, animated: true)
  end

  def scrollViewDidScroll(scrollView)
    origin = scrollView.contentOffset
    scrollView.setContentOffset(CGPointMake(origin.x, 0.0))
    @pageControl.currentPage = @scrollView.contentOffset.x / @scrollView.frame.size.width
  end

end
