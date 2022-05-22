-- MySQL dump 10.13  Distrib 8.0.28, for macos12.2 (x86_64)
--
-- Host: localhost    Database: PF_development
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(191) NOT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2022-05-21 17:05:23.538156','2022-05-21 17:05:23.538156');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diaries`
--

DROP TABLE IF EXISTS `diaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diaries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `diary_content_0` text,
  `diary_content_1` text,
  `diary_content_2` text,
  `objective_0` text,
  `objective_1` text,
  `objective_2` text,
  `objective_3` text,
  `objective_4` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `start_at` datetime(6) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diaries`
--

LOCK TABLES `diaries` WRITE;
/*!40000 ALTER TABLE `diaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `diaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ego_scores`
--

DROP TABLE IF EXISTS `ego_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ego_scores` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cp_score` int DEFAULT NULL,
  `np_score` int DEFAULT NULL,
  `a_score` int DEFAULT NULL,
  `fc_score` int DEFAULT NULL,
  `ac_score` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `test_result_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ego_scores`
--

LOCK TABLES `ego_scores` WRITE;
/*!40000 ALTER TABLE `ego_scores` DISABLE KEYS */;
INSERT INTO `ego_scores` VALUES (1,20,20,20,20,20,'2022-05-21 18:28:24.971437','2022-05-21 18:28:24.971437',1,11),(2,20,20,20,20,20,'2022-05-21 19:06:17.613749','2022-05-21 19:06:17.613749',2,11),(3,20,20,20,20,20,'2022-05-21 19:10:04.267900','2022-05-21 19:10:04.267900',2,11),(4,20,20,20,20,20,'2022-05-21 19:29:09.693661','2022-05-21 19:29:09.693661',2,11),(5,20,20,20,20,20,'2022-05-21 19:31:33.332641','2022-05-21 19:31:33.332641',2,11);
/*!40000 ALTER TABLE `ego_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goals` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goal_content_0` text,
  `goal_content_1` text,
  `goal_content_2` text,
  `goal_content_3` text,
  `goal_content_4` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raise_types`
--

DROP TABLE IF EXISTS `raise_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raise_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `raise_type` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raise_types`
--

LOCK TABLES `raise_types` WRITE;
/*!40000 ALTER TABLE `raise_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `raise_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(191) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20220113143346'),('20220115060929'),('20220118104916'),('20220119065836'),('20220119075024'),('20220119080315'),('20220119090944'),('20220119125134'),('20220122103930'),('20220122153934'),('20220202151523'),('20220225143757'),('20220225144019'),('20220225144032'),('20220225162851'),('20220225233959'),('20220226083921'),('20220226114223'),('20220226121200'),('20220228113113'),('20220302134840'),('20220303030850'),('20220305084540'),('20220310121323'),('20220310123554'),('20220310124502'),('20220313003303'),('20220409015218'),('20220409024134');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_results`
--

DROP TABLE IF EXISTS `test_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_results` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `egogram_type` varchar(191) DEFAULT NULL,
  `character` text,
  `stregth` text,
  `weakness` text,
  `people_around_you` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_results`
--

LOCK TABLES `test_results` WRITE;
/*!40000 ALTER TABLE `test_results` DISABLE KEYS */;
INSERT INTO `test_results` VALUES (1,'クールネガティブ','自分をコントロールするのが上手で、いつも一歩引いてクールに状況を判断\r\n自分の得にならないと思うときは、真逆の意見を持っていてもその場の空気に合わせてイエスという傾向があります。」\r\nむやみに本音を他人に打ち明けるようなことはしません。感情よりも客観的事実やデータを優先するので、気分で考えがぶれることがなく、いうことや行動に一貫性がある人と言えるでしょう。\r\nまた、厳格さを示すCPが高いので、自分を甘え明かしません。\r\nどんなに苦しくても「まぁいいか！」と手抜きしたりせず、きちんと最後までやり遂げます。\r\n人を裏切ることはなく、規則も厳格に守る傾向があります。\r\nこれらの特徴から、周囲からは「頼り甲斐のある誠実な人」として信頼されているでしょう。\r\n一方、空気を読むので人付き合いは悪くなく、飲み会などにも参加しますが、自分からどんどん人を誘ったり、場を盛り上げたりするキャラクターではありません。\r\nこのタイプにとって「面白いこと」に対しての優先度は低いので、一緒にいて楽しいという印象ではないでしょう。\r\n新しいことや方法にチャレンジするのも得意な方ではありません。\r\n物事をクールに分析して、ちょっとでもリスキーなことには手を出さない防御力高めの性格です。','基本的に真面目なので、コツコツ頑張るのがとても得意です。\r\n大抵の人が逃げ出してしまうような単調な仕事でも黙って頑張り通します。\r\n期日をしっかり守り、ミスも少ないので、上司や目上の人からは右腕として重宝されます。\r\n気分や衝動に左右されないのでいつも規律正しく、常識があり、礼儀が重んじられる公的な場に向いています。\r\nライフプランもしっかりしていて、お金を貯めるのは得意です。','自分に厳しく抑制しているので、当然のように他人にも同じレベルを求めてしまう傾向があります。\r\nその結果、知らないうちに自分のこだわりやルールを人に押し付けてしまうこともあります。\r\nまた、状況をクールに判断するあまり、「どうせ無理」と消極的になりすぎる傾向があります。\r\nストレスを溜め込みすぎると、取り返しがつかないほど大爆発してしまうタイプなので要注意！','理性的なつもりが、よくわからない人扱いされることがあります。\r\n感情的な話は聞くのもするのも苦手で、もし自分の意見を言って損をしたらどうするかと考えるタイプです。\r\n本音はもちろん、ちょっとした感想ですらなかなか他人に話すことはありません。\r\nしかし、この態度が周りには「いつも黙っていて、何を考えているのかわからないちょっと不思議な人」と思われてしまうことも。\r\nまたアドバイスをしたら「細かい人認定」されることがあります。\r\n一度、成功するとずっとその方法でやり続けるという傾向があります。\r\n絶対に失敗しない安心で確実な方法だから、という考え方です。\r\nそのため、人に物を頼むとき、つい自分の中で持っている「失敗しない確実な方法」をアドバイスしてしまうのですが、それが押し付けがましく取られてしまう可能性があります。\r\n結果だけではなくやり方まで指定してくる、細かくて融通の利かない人だという印象を与えてしまうかも。\r\nまた仕方なくやっていたことがいつの間にか便利な人として扱われることがあります。\r\n自分の評価が下がることには耐えられないので、常に人の顔色や場の空気をとても気にしてしまいます。\r\nそのため、嫌なことや不得意なことでも頼まれれば断れないことがあります。\r\n周りからはとても頼みやすい人に見えてしまい、時に「あの人に頼めばいいや」と便利屋さん扱いされてしまうこともあります。\r\n感情や表情や態度に出ないので、相手はあなたが嫌がっていることに気づかないことも多々あります。','2022-05-21 18:51:55.210007','2022-05-21 19:24:41.915285'),(2,'楽天家',NULL,NULL,NULL,NULL,'2022-05-21 18:53:18.879090','2022-05-21 18:53:18.879090'),(3,'献身',NULL,NULL,NULL,NULL,'2022-05-21 18:53:44.461611','2022-05-21 18:53:44.461611'),(4,'野心家',NULL,NULL,NULL,NULL,'2022-05-21 18:54:12.781514','2022-05-21 18:54:12.781514'),(5,'合理的','','','','','2022-05-21 18:54:16.765364','2022-05-21 18:55:01.353430'),(6,'きまじめ',NULL,NULL,NULL,NULL,'2022-05-21 18:55:13.056682','2022-05-21 18:55:13.056682'),(7,'ディープネガティブ',NULL,NULL,NULL,NULL,'2022-05-21 18:55:32.856791','2022-05-21 18:55:32.856791'),(8,'天真爛漫',NULL,NULL,NULL,NULL,'2022-05-21 18:55:42.138247','2022-05-21 18:55:42.138247'),(9,'頑固一徹','融通が効かず、まさに頑固一徹という言葉が当てはまる性格です\r\n曲がったことは大嫌いで、何事もきちんと筋を通すべきだと考えています\r\n人付き合いにおいても、義理人情に厚く、礼儀に適ったスタイルを理想としています\r\n養育的な優しさや保護性を示すNPが高めなので、かなり面倒見が良いのもこのタイプの特徴です\r\n自分をリスペクトしてくれたり、懐いてくれる後輩や部下にはまるで親のような大きな愛情を持ってしっかりと面倒を見てあげるでしょう\r\n不器用でなんでも一度こう決めたらなかなか変更しません\r\n人にあれこれ指摘されると余計に意固地になってしまう面もあります\r\n融通が効く性格の人や若い人からは「堅苦しい、気難しい」と敬遠される傾向があります\r\n逆に年配の人からのウケはいいですし、「今時に珍しい、芯のしっかりした人」として評価してもらえるでしょう','自分を甘やかすことなく、いつも全力を尽くします\r\n締め切りやクオリティに関しても、高い責任感と職人気質な性格で、相手が求める以上のレベルで答えることができます\r\n途中で物事を投げ出したり、約束を破るようなことは絶対にない、誠実で頼り甲斐のある性格です\r\nこのタイプに頼ればなんとかなる、と思って当てにしている人も多いはずです','自分が取り組んでいることが山場に差し掛かったり、修羅場になったりすると、それに打ち込みすぎて全く周りが見えなくなってしまします\r\n日頃からマイペースな傾向はありますが、こうなると職場でのチームワークや、家庭への配慮も全部忘れ去って、一心不乱に没頭します\r\nこういう状態が何ヶ月も続くことも珍しくありません\r\nやっと一段落ついて顔を上げた時には、周囲の人が愛想をつかしてしまっていることもあるでしょう','抱えた課題は一生懸命こなすのが当然でちゃんとした使命感を持って、それなりの成果が出るまでは頑張るべきだと考えています\r\n必要とあれば、寝食を忘れて、必死に没頭することもためらいません\r\nこの職人気質なスタイルが、人によっては「誰からもそこまで言われてないのに、あなたは独りよがりだよね」と思われてしまうこともあります\r\nこのタイプには「社会で生きる異常は、筋と道理は当然通すべき」という概念が生まれつき備わっています\r\n電話は自分から名乗る、物を頼むときはきちんと状況を説明する、何かあったらまず上司に相談する、約束は守る、返信は必ずする、一度口に出したことは実行する、お礼と報告は欠かさないなど、どれも基本的なことで難しいことは一つもありません\r\nしかし、履歴書をパソコンで作り、アプリで業務連絡をする世代からは通用せず、「古い」と思われている恐れがあるでしょう\r\n休みの日でも別に遊びに行かなくて良く、家で仕事の準備や家事をして「自分のメンテナンス」をしていた方が安らげると思うタイプ\r\n仕事も家事も一生懸命やればいろんな面白みがある物だと、それだけで十分毎日充実して楽しいと本心から思っています\r\nしかし、遊びや趣味のない、寂しい生活を送っている人に見えてしまうことがあるようです','2022-05-21 18:55:47.083195','2022-05-21 19:27:41.818036'),(10,'駄々っ子','奔放さと子供らしさを示すFCが突出して高いことがこのタイプの性格を大きく方向付けています\r\n大事なことは、今自分がしたいことをすること、本能の赴くまま、欲望に忠実に生きています\r\n後先や損得は考えないので、ある意味で刹那的とも言えるでしょう\r\nやりたいと思ったらなんとしてもやる、欲しいと思ったものは手に入れないと気が済まない、という性格です\r\n社会の常識や義理人情に縛られて我慢するということは、このタイプには見られません\r\nひらめきと直感で行動が決まるので、自分でも自分のことが予想できませんが、周囲はもっとそう感じています\r\n「次は何をやらかすんだろう？」と思われていることも少なくないでしょう\r\n好奇心が旺盛で感受性が高く、明るいのが特徴です\r\nまた、寂しがりでもあり、人に好かれていたい、褒められたいという気持ちが強く、逆に嫌なことは論理的な話や重い責任です\r\n嫌いなことはカットして、もっと楽に楽しくしたいと思っています\r\nただ、自分にそういう側面が欠けているという自覚は持っています\r\n責任感を示すCPの高いタイプ、論理性に優れるAの高いタイプに対しては、安心を感じるので一緒にいたいと思うでしょう\r\n本能に忠実なので、好きと思う気持ちをコントロールするのが苦手です\r\n不倫関係に陥りやすいタイプなので注意が必要です','一旦やりたいと思ったら立ち止まることはありません\r\nどんなに道な世界にでも躊躇うことなく飛び込んでいく、抜群の実績力があります\r\nダラダラと迷ったりせず、強い好奇心で次々にやりたいことが湧いてきます\r\n自分で体験して楽しむタイプなので、話題の多い人でもあります','「自分がやりたいかどうか」が全ての判断基準なので、ルールや習慣を破るつもりはないのですが、疎かになりがちです\r\n仕事と遊びとの公私混同による周囲からの批判されることもあります\r\nやりたいことしかやらない性格とも相まって、お堅い会社勤めは向いているとは言えません','せっかくの楽しいことは人と一緒にやりたいと思っており、一人だと楽しさが半減というように思っています\r\n自身は単純にそう思っているだけなのですが、「自己中」だと思われやすい側面でもあります\r\n「自分のやりたいことに、寂しいからという理由だけで人を突き合わせようとする人」という印象を与えるのが原因のようです\r\n自分の気が向いたことには手が早いですが、逆に気の向かないことには少しもやる気が起きないタイプです\r\n例えるならお子様ランチの好きなおかずだけを食べているように、気の向くことばかりやって、その他のことは全部後回しするという傾向があります\r\nこの気が向くかどうかが周りの人からはわからないので、会社組織のようなところではわがままな使いづらい人だと尾も荒れてしまう恐れがあるでしょう\r\nやってみたいと思ったことはすぐにやってみたい、人生一度きりだから興味のあることに挑戦しないでどうするの？と考えがちなタイプなため、職場も果敢に変える傾向が見られます\r\nこのタイプにとって終身雇用は大した魅力ではありません\r\n時には人が驚くような転職回数になることもあり、それでいい加減な人というイメージを抱かれることがあります','2022-05-21 18:55:54.369491','2022-05-21 19:28:37.521060'),(11,'パーフェクト','エゴグラムの5つの要素全てにおいてハイレベル','不向きな仕事などはありません\r\nトップクラスの結果を出すことができます','理性的で自制心もありますが、やきもち焼きです','時間がなくて適当にやっつけた','2022-05-21 18:56:02.647083','2022-05-21 19:31:24.908924'),(12,'平凡',NULL,NULL,NULL,NULL,'2022-05-21 18:56:13.330931','2022-05-21 18:56:13.330931'),(13,'無欲',NULL,NULL,NULL,NULL,'2022-05-21 18:56:18.949446','2022-05-21 18:56:18.949446'),(14,'お気楽',NULL,NULL,NULL,NULL,'2022-05-21 18:56:24.907117','2022-05-21 18:56:24.907117'),(15,'クール',NULL,NULL,NULL,NULL,'2022-05-21 18:56:29.533809','2022-05-21 18:56:29.533809'),(16,'直感行動',NULL,NULL,NULL,NULL,'2022-05-21 18:56:38.227591','2022-05-21 18:56:38.227591'),(17,'クローズ',NULL,NULL,NULL,NULL,'2022-05-21 18:57:09.384615','2022-05-21 18:57:09.384615'),(18,'熱血',NULL,NULL,NULL,NULL,'2022-05-21 18:57:14.943006','2022-05-21 18:57:14.943006'),(19,'堅実',NULL,NULL,NULL,NULL,'2022-05-21 18:57:19.532055','2022-05-21 18:57:19.532055'),(20,'お人好し',NULL,NULL,NULL,NULL,'2022-05-21 18:57:25.400332','2022-05-21 18:57:25.400332'),(21,'理屈',NULL,NULL,NULL,NULL,'2022-05-21 18:57:30.214014','2022-05-21 18:57:30.214014'),(22,'自由奔放',NULL,NULL,NULL,NULL,'2022-05-21 18:57:36.566992','2022-05-21 18:57:36.566992'),(23,'ナイーブ',NULL,NULL,NULL,NULL,'2022-05-21 18:57:41.536688','2022-05-21 18:57:41.536688'),(24,'該当なし',NULL,NULL,NULL,NULL,'2022-05-21 18:57:45.947172','2022-05-21 18:57:45.947172');
/*!40000 ALTER TABLE `test_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL DEFAULT '',
  `encrypted_password` varchar(191) NOT NULL DEFAULT '',
  `reset_password_token` varchar(191) DEFAULT NULL,
  `reset_password_sent_at` datetime(6) DEFAULT NULL,
  `remember_created_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `uid` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `raise_type_id` bigint DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test@aaa.ca','$2a$12$Mc6jF0D96ldpOw9HLHEypeC.SkP6MK4gd5GJM8UAZvmXIZtxgitsu',NULL,NULL,NULL,'2022-05-21 18:27:46.411949','2022-05-21 19:03:12.350501',NULL,NULL,'test',NULL,NULL,NULL),(2,'example1@example.co.jp','$2a$12$npge4SVW2/KA.hLPTUtL.O65OL1sMTUHkht5fk9L5mqELvY8tHsWy',NULL,NULL,NULL,'2022-05-21 19:05:43.678293','2022-05-21 19:09:55.927162',NULL,NULL,'私です',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-22 14:51:00
