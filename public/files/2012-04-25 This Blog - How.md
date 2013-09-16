---
Title: This Blog - How (or: How I Learned to Stop Worrying and Love the Blog)
Date: 2012-04-25 18:10
Link: this-blog-how
Tags: Tech
---

A couple of weeks ago I wrote [a post](http://mattmart.in/post/this-blog-why) explaining *why* I put this site together. Now for the how.

In many ways, the two questions—why and how—are inseparable. To explain, I'll have to provide some back story. 

**Growing Pains with MNpublius**

Part of what I enjoyed about [MNpublius](http://mnpublius.com) was the technical side of things, the tinkering. But this enjoyment developed over time. When I started, I didn't have much of a clue. While I had slapped together a number of static websites, building and hosting a blog was far beyond my skillset. Blogger was mindlessly simple. Pick a sub-domain, pick a title, pick a theme, and *boom*, you're an author. That, of course, was the genius of Blogger. At the time, it was really in a league of its own.

Blogger was a bit like a blog with training wheels: sure you could do what the big boys were doing, but there was always some minor embarrassment and occasionally you just got left behind. Even so, it slowly got me hooked on playing with code—what if I want the sidebar to do *this*; oh, well, I didn't want *that*; how is that guy making that *work*? But eventually, the simplicity that was originally empowering felt more and more limiting. So I took it upon myself to host my own copy of WordPress. It's almost laughable, but it was a big step at the time.

With WordPress I learned a whole new tool: PHP. Suddenly, code was no longer static, but had logic and reason to it (well, *some* logic and reason, it is still PHP after all). But, yet again, the system started to feel limiting. Somewhat ironically, the robustness that had originally attracted my to WordPress began to feel oppressive. Bugs were showing up all the time, updates constantly needed tending to, and the whole package was bloating as fast as a Microsoft product. 

Then, it all came crashing down. A commenting robot exploited a hole in WordPress's commenting system to embed malicious code into the body of every single post (it was over 3000 at the time). The code would automatically reroute you to a spam website. It was awful.

I knew that I could fix it. In fact, exporting the entire database into a text file and doing a find and replace would probably have been sufficient. But I was done. I was done with all the bloated junk WordPress brought with it, I was done with managing inconsequential minutia, and more importantly, I was done with blogging.

So I salvaged what I could off the sinking ship and jumped into a lifeboat called Tumblr. Tumblr was a back-to-basics experience. It immediately eliminated mountains of crap and allowed everyone to refocus on what we were supposed to be doing: writing.

But I was done with blogging anyway.

**Obsessing**

I began thinking about *this* blog long before I stopped blogging at MNpublius. I would day-dream about my perfect setup: no cruft, lean, total control, and a focus on writing. 

As time went on, the desire not only to write, but to write on this ideal setup became a bit of an obsession. I knew that I wanted blog posts to be text files formatted in nothing but Markdown. I knew that I wanted to be able to access the text files from anywhere. I knew that I wanted to retain complete control over my work-product. I knew that I wanted a responsive design. And I knew that I wanted the process of publishing to be drop-dead simple.

I was also learning Rails at the time, so I was initially dead-set on building it myself. *So* I built a little Rails blog, but it didn't parse the posts from text files. *So* I turned to [Jekyll](https://github.com/mojombo/jekyll) and upgraded it to use markdown files for posts, but then I wasn't happy with the publishing process. *So* I devised a hack with my Dropbox and an Applescript to publish whenever a new file was dropped in a particular Dropbox directory, but there were a number of worrisome problems with that... *So* on, and *so* on, and *so* on. I think I built a dozen iterations of the site and explored *way* more solutions. Everything from Marco's [Second Crack](http://www.marco.org/secondcrack) to WordPress was considered (yes, that's how crazy I became).

**Enter: Scriptogr.am**

The original ah-ha moment occurred when I read [Joe Hewitt's post](http://joehewitt.com/2011/10/03/dropbox-is-my-publish-button) on using Dropbox as the backbone of his new blog. That made a lot of sense, but Joe's system seemed a bit convoluted and too much work. Instead, I began to search around for similar solutions and came across [Calepin](http://Calepin.co/). Calepin is very nice, but it has several drawbacks that killed it for me. First and foremost being its complete lack of customization. I wanted simple, but I still wanted some identity.

In the course of reading about Calepin, I came across [Scriptogr.am](http://scriptogr.am/). Initially it appeared that Scriptogram suffered from the same lack of control that Calepin did. Like Calepin, there is no way to directly access the code for your site but, crucially, you can access html and css templates. That was enough.

Let me explain how wonderfully simple the setup is for this blog. I have a Dropbox folder with all my posts in Markdown files. Each post is a new file and I can name it whatever I want. Each file has a very simple, very brief header with the title, the date, a link (if I want a link post), and tags (if I choose). Other than that, it's just Markdown. Because it lives on my Dropbox and it's formatted in Markdown, I can blog from a variety of wonderful apps on virtually any platform.  Right now, I am writing this post in [ByWord](http://bywordapp.com/) on my Mac. If I so choose, I can pick it up on my iPad or edit it on my iPhone or even edit it on my work computer (which is a PC running, *gasp*, XP). When I'm ready to publish, I just his "publish" on Scriptogr.am (login is even handled via Dropbox).

A notable bonus: Scriptogr.am provides a very lovely bookmarklet that allows me to start a post from anywhere and I can edit it online in Scriptogr.am's wonderfully sparse text editor (which saves the post as a Markdown file in my Dropbox).

It's fantastic.

The obvious drawback is that the backend is a closed system, but I think the up-side of this outweighs the down-side. The down-side is the small pit in your stomach that forms from being unable to directly access the code of your site and knowing that you're relying on some unproven service to keep your site up. The up-side is that you don't have to worry about any of it. 

So far, I have had zero problems. I had to do a couple "hacky" things to make the category pages and navigation work the way I wanted (because there's only one html template for the whole site), but they work just fine and were not particularly difficult to deploy. But other than that, I really have no complaints.

And at the end of the day, having no complaints is a pretty great way to stop obsessing and start writing.