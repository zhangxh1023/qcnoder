//
//  PreviewData.swift
//  qcnoder
//
//  Created by zhangxh1023 on 2022/10/3.
//

import Foundation

public struct PreviewData {
  
  public func getTopic() -> TopicModel {
    var author = AuthorModel()
    author.avatarUrl = "https://avatars.githubusercontent.com/u/227713?v=4&s=120"
    author.loginname = "atian25"

    var topic = TopicModel()
    topic.id = "62e0d536d3061f33b8e85386"
    topic.authorId = "4f447c2f0a8abae26e01b27d"
    topic.tab = "share"
    topic.content = "<div class=\"markdown-text\"><blockquote>\n<p>知乎原文地址：<a href=\"https://zhuanlan.zhihu.com/p/546175922\">https://zhuanlan.zhihu.com/p/546175922</a> ， 求个赞~\nNodeParty 2022.08.08 邀您线上围观，直播预约地址见文末。</p>\n</blockquote>\n<h2>相识于微末</h2>\n<p>我是一个野生的程序猿，非科班出身，在非互联网小公司待了很多年。刚开始工作的时候，还没有前端这个岗位，不过高三的时候就接触过网页三剑客，一见钟情于 HTML/CSS/JS 的『所见即所得』，懵懵懂懂间经历过 JavaScript 停滞的那几年，也被 GMail 引领的翻身之战惊艳过，重新认识了前端。</p>\n<p><img src=\"//static.cnodejs.org/FlRpbwKzQWfj6vKKPI7vRILJ7aqk\" alt=\"yuque_diagram.jpg\"></p>\n<p>JavaScript 一开始只能在浏览器这个容器中运行，2009 年 Ryan Dah 在研究 V8 引擎时突发奇想，JavaScript 本身就是单线程的，而且浏览器发起的 AJAX 请求就是非阻塞的，如果将 JavaScript 和异步 IO 以及一个简单的 HTTP 服务器集合在一起，就会变成一个很酷的东西。于是在同年 05 月 01 日，Ryan Dah 在与 Tim Becker 的邮件讨论中正式把它命名为 node，同月 27 日发布第一个版本，随即在 11 月的 JSConf EU 上正式对外发布。</p>\n<p>2011 年，正在沉浸于用 ExtJS 和 Flash 为电信 ERP 系统打工的我，时不时会写一些小工具来帮自己偷懒，但一直没找到合适的工具，苟且于 Groovy 和 Swing。有一天无意间刷 OSChina 资讯时看到 Node.js 的新闻，当时的第一反应是：『又一个 jQuery 轮子？切~~』，幸运的是基于『多少看一下反正不要钱，闲着也是闲着』的想法，点击了进去，于是发现了一个新的世界，真香~</p>\n<p>记得当时微信公众平台刚出来，我的第一个练手项目就是 <a href=\"https://github.com/node-webot\">node-webot</a>，也是第一次参与开源。</p>\n<hr>\n<h2>刀耕火种</h2>\n<p>2013 年，入职了 UC。此时的业界，已经有了前端岗位，归属于设计部门，也叫重构工程师。前端开始进入富应用时代，但还非常的刀耕火种。</p>\n<p>2014 年，在 UC 遇到了 云龙，有幸和他一起探索 UC 的前端工程化，基于 FIS 之上实现了 Scrat，那是一段很快乐的时光。 FIS 的实现本身虽然比较粗糙，是基于正则表达式而不是 AST 的，但它的工程化思维却非常的前沿。</p>\n<p>现在很多人聊起 Node.js，第一印象可能是：『一个自不量力的想抢 Java 饭碗的语言』，但其实 <strong>命令行工具 才是 Node.js 最初落地及最大的应用场景，它给前端领域带来了巨大的变革：Grunt 的出现让前端有了自己的构建工具，Babel 的出现让我们停滞已久的标准化重焕生机，Webpack 的出现让前端工程化有了基石，前端基建进入新石器时代。</strong></p>\n<p><img src=\"//static.cnodejs.org/FurQDrabVnkNOE4weUDSAw2aspUl\" alt=\"1658733897206-5fb8a56d-1330-4108-b54a-287ff9a43c7e.png\"></p>\n<blockquote>\n<p>参考阅读：《前端工具链十年盘点》，<a href=\"https://zhuanlan.zhihu.com/p/462985064\">https://zhuanlan.zhihu.com/p/462985064</a></p>\n</blockquote>\n<hr>\n<h2>全栈工程师</h2>\n<p>2014 年，随着 UC 被阿里收购，我被动的完成了毕业时的目标之一。同年 6 月 21 日的 JSConf CN 大会上，赫门 分享了 《淘宝前后端分离实践》，吹响了国内前端 <strong>前后端分层</strong> 的号角，BFF 的基石也正是 Node.js 这一武器。</p>\n<p>2015 年 11 月 13 日，在 苏千 的号召下，成立了 Node.js 虚拟工作组，聚集了来自蚂蚁、淘宝、ICBC、UC 等等 BU 的接口人进行共建，我作为 UC 的代表来到了杭州，核心成员闭关一周，产出了 EggJS，寓意是希望帮助各团队架构师孕育出适合团队业务场景的上层框架。随着它的完善，Node.js 生态有了三驾马车（ EggJS 框架、TNPM 包管理、AliNode 性能分析）的护航。</p>\n<p><img src=\"//static.cnodejs.org/FrC78irYYLL0KKSRqE_NcrirPojf\" alt=\"1658744625445-5ab86d91-d3b2-4548-b89e-fad3963508ba.png\"></p>\n<p>Node.js 在服务端的起点，是 BFF 聚合层。BFF 聚合层一直都存在，它不局限于语言，只不过之前由 Java 团队来负责。随着业务复杂度和专业度提升的要求，由前端团队来接管这一层，更有利于服务自治和高效协作，于是很多前端团队选择了 Node.js 来承载它。同时也有一拨人基于它来建设前端新基建，如 npmmirror 前端包镜像服务、前端研发平台、前端活动运营平台等等。</p>\n<p><strong>在移动互联网的浪巅下，前端肆意地探索着自己的边界，从 PC 到 H5，从 WebView 到 APP，从 Browser 到 Server，这是属于前端的大航海时代，一时间人人都是全栈工程师。</strong></p>\n<p>这是一个全栈爆发的时代，这是一个活力四射的时代。我们冲锋陷阵有了不少突破，但我们也留下了很多历史债。</p>\n<hr>\n<h2>静水深流</h2>\n<p>2019 年初，我加入了蚂蚁体验技术部，来到了那个 EggJS、CNPM 诞生的地方，成为了一名前端基础技术人，专注于 Node.js 基础设施的建设。</p>\n<p>真正投入到基础设施后，你会发现后端的领域非常广阔，要让一个新生的基础设施完善以及得到认可，需要一代代人的努力和沉淀。</p>\n<ul>\n<li>我们实现了各种后端服务的 SDK，因为在那个年代跨语言支持友好性不像今天这样是一个共识。</li>\n<li>我们实现了 EggJS 框架、TNPM 包管理、AliNode 性能分析 三驾马车来为业务开发护航。</li>\n<li>我们实现了自己的研发平台，收敛研发模式，对接下游 PaaS 等基础设施。</li>\n<li>我们在语雀、云凤蝶、雨燕等场景都大规模的深度使用了 Node.js。</li>\n</ul>\n<p>近年来，我们进入了平台治理期，我们变得更耐心和更克制，围绕着前端核心场景去深入，不会把 Node.js 作为锤子去找钉子。</p>\n<p><strong>我们不再追求人人都是全栈工程师，前端领域目前已经足够广大，术业有专攻，我们的目标是把部分前端培养成全栈，成为前端新基建的护航者，让一线前端可以无感的没有额外负担的享受到这些能力，从而给业务带来创新。</strong></p>\n<p>我们不再追求全民 BFF 化，而是会帮助业务一起分析架构选型，协建上层业务平台的方式来提升效能和 ROI。我们重新审视原来的基础设施，结合最新的前端实践进行更极致的翻新，如过去一年在 CNPM Rapid 等方面的实践。</p>\n<blockquote>\n<p>“<strong>Any application that can be written in JavaScript, will eventually be written in JavaScript</strong>.” – Jeff Atwood（任何可以用 JavaScript 来写的应用，最终都将用 JavaScript 来写。）</p>\n</blockquote>\n<p>这段话曾经在前端圈很流行，我个人觉得它既对，也不对。在那个时代，Node.js 这个少年处于野蛮生长时代，年轻人总需要去证明一点什么，证明这世界上没有什么是不可能的，一切皆有可能。但成长后的少年，已经不需要去为了证明什么而去做些什么，而是需要聚焦回核心航道上的事，不用分心在可以做但没必要做的事上。</p>\n<blockquote>\n<p>“<strong>The strength of JavaScript is that you can do anything. The weakness is that you will.</strong>” – Reg Braithwaite （JavaScript 的优点是可以写任何东西，缺点是你真的会用它去写这些东西。）</p>\n</blockquote>\n<p>这句话，我认为是对上一段话的回应，或者说下联，我们需要正确且理智的看待手中的武器，并使用在合适的场景。</p>\n<hr>\n<h2>Node Party</h2>\n<p>不知不觉，Node.js 已经陪伴了我十年，在工作中一直在深度实践，在社区也一直在做 Node.js 的科普工作。但我一直不觉得自己是 Node.js 布道师，我只是一个记录者，我也不觉得 Node.js 是万能的，不觉得它能拳打脚踢 Java 等语言，每个团队的起点、技术背景、基础设施都不一样，不能一概而论。</p>\n<p><strong>我坚信它对前端领域的价值，是一个不可或缺的基础设施，或许未来前端的变革使得一切工程问题从根本上得到解决，但不管怎样，我只是希望当下能认真记录自己以及同行者们在这个领域的所见所想，与正在经历前端工业化演进并被此过程困扰的同学交流心得，让大家有所参考从而迈出自己的路。</strong></p>\n<p>经历过前端大航海时代的同学，一定还记得当年 JSConf CN、Node Party、前端圈等各种大会，那真是一个令人怀念的纯真的技术年代啊。近几年来，各种大会少了不少，也有人会吐槽没啥干货，其实不必纠结，因为前端已经到了一个平台期了，它涉猎的范围太广了，自然会显得有点平淡，其实不尽然，我们一直都在前行着。</p>\n<p>去年底 苏千 找我说，办个 Node Party 吧，我一开始有点疑虑，因为我们正在做的很多都是内部的治理工作，社区的同学不一定能理解和有所收获。苏千说：『没关系的，我们既然一直在这条路上走着，我们有义务跟社区分享下我们的所思所得，让大家知道，还有这么一群人一直在前行着』。</p>\n<p>因此，今天诚邀大家参与蚂蚁集团举办的 <strong>Node Party 2022.08.08 线上直播</strong>，我们分享的内容包括：</p>\n<ul>\n<li><strong>Node.js What’s Next</strong>，来自 Node.js Contributor 的分享，介绍  Node.js 工作组正在推进的战略计划，以及如何参与定义  Node.js 的未来。</li>\n<li><strong>基于 cnpmcore 实现企业级包管理服务</strong>， 来听一听 cnpm registry 全新重构的技术内幕和架构思考。</li>\n<li><strong>cnpm rapid 正式开源</strong>，上半年我们曾分享过的 『深入浅出 tnpm rapid 模式 - 如何比 pnpm 快 10 秒』，终于到 show me the code 环节了。</li>\n<li><strong>从 Egg 到 Artus，谈谈框架的框架的初心</strong> ，分享来自蚂蚁、字节、蔚来团队的共建。</li>\n</ul>\n<p>也许我们还没完全准备好，还在持续的完善中，但我们希望能让社区的同学知道，我们一直都在前行，等你~</p>\n<p>B 站预约传送门： <a href=\"https://live.bilibili.com/21726701\">https://live.bilibili.com/21726701</a>，敬请关注。</p>\n</div>"
    topic.title = "我的 Node.js 十年 -- 写在 NodeParty 2022 前夕"
    topic.lastReplyAt = "2022-09-28T00:47:38.980Z"
    topic.good = true
    topic.top = true
    topic.replyCount = 13
    topic.visitCount = 42946
    topic.createAt = "2022-07-27T06:03:34.611Z"
    topic.author = author
    return topic
  }
  
}
