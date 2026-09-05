#!/bin/bash

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-LIT-P01_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Read the following passage and answer the questions that follow.\n\nOn Monday evening, David, the proofreader, said to Emma, the editor:\n\n\"I haven't read the revised version that Michael sent this morning yet. As for the version I read and returned last week, I think there are no other major problems as long as the paragraph immediately before the conclusion is revised.\"\n\nAbout an hour before hearing this, Emma had sent Michael the following email:\n\n\"David has more or less approved it as well. It looks like everything should be fine if you just address his final comment.\"\n\nThe next morning, Michael replied:\n\n\"In the latest version I sent last night, I deleted the paragraph you mentioned. I moved the table corresponding to that paragraph to the appendix, but the table itself has not been changed from the version I sent last week.\"\n\nEmma forwarded the email to David and wrote:\n\n\"It seems that the condition you mentioned yesterday has been satisfied.\"\n\nDavid replied:\n\n\"What I asked for was a revision, not deletion. Also, the version I read was last week's version, not the latest version sent last night.\"\n\nFor each of the following statements, write T if it must be true based on the passage, F if it contradicts the passage, and U if it cannot be determined from the passage alone.\n\nA. By Monday evening, David had read the revised version that Michael had sent that morning.\n\nB. At the time Emma wrote the email, David had not yet read the revised version sent that day.\n\nC. In the latest version, Michael left the paragraph that David had objected to in the main text and rewrote its contents.\n\nD. By Tuesday, it can be concluded that David would necessarily approve the latest version if he read it.\n\nE. David's statements on Monday and Tuesday are consistent with each other on the point that the paragraph in last week's version required a change.\n\nOutput only a JSON object in the following format, with no explanation:\n\n{\"A\":\"T/F/U\",\"B\":\"T/F/U\",\"C\":\"T/F/U\",\"D\":\"T/F/U\",\"E\":\"T/F/U\"}"
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-LIT-P02_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Read the following conversation and report.\n\nAfter the test was completed, the lead researcher, James, made the following statement:\n\n\"I would not say that the test was a success as planned. However, it would not be accurate to say that the test itself was a failure either. Of the three evaluation criteria, the temperature was within the specified range. The pressure could not be evaluated because there was a malfunction in the measuring instrument. The purity was below the required standard.\"\n\nEmily, the staff member responsible for the test, asked:\n\n\"Then does that mean we do not need to change the temperature setting for the next test?\"\n\nJames replied:\n\n\"At the very least, we cannot say that the setting needs to be changed solely on the basis of the results of this test.\"\n\nLater, Emily wrote the following in an internal report:\n\n\"This test confirmed that the current temperature setting is appropriate. In addition, it is likely that the pressure met the required standard.\"\n\nFor each of the following statements, classify it as E if it is logically supported by the conversation, C if it contradicts the conversation, and U if it cannot be determined from the conversation alone.\n\nA. The temperature was within the specified range in this test.\n\nB. This test confirmed that the current temperature setting is generally appropriate.\n\nC. The possibility that the pressure met the required standard has been ruled out.\n\nD. It is likely that the pressure met the required standard.\n\nE. The purity did not meet the required standard.\n\nF. James stated that the temperature setting must not be changed for the next test.\n\nOutput only a JSON object in the following format:\n\n{\"A\":\"E/C/U\",\"B\":\"E/C/U\",\"C\":\"E/C/U\",\"D\":\"E/C/U\",\"E\":\"E/C/U\",\"F\":\"E/C/U\"}"
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-LIT-P03_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Read the following passage carefully.\n\nOn Saturday, Emily told Naomi:\n\n\"On Thursday, Kevin told me this:\n\n'Yesterday, Ryan said to me,\n\"Tomorrow, I'll tell your older sister that the draft she sent me the day before yesterday was the same as the version I approved last Friday.\"\nBut don't tell her that yet. I haven't checked the draft myself.'\n\nThat's what Kevin told me.\"\n\nNaomi asked:\n\n\"So Ryan said on Thursday that he would contact your older sister?\"\n\nEmily replied:\n\n\"No. I think you've got that part wrong.\"\n\nAnswer the following questions based only on the passage.\n\nA. On what day of the week did Ryan make his statement to Kevin?\n\nB. What day of the week does \"tomorrow\" in Ryan's statement refer to?\n\nC. Who does \"your\" in \"your older sister\" refer to?\n\nD. Whose older sister does Ryan intend to contact?\n\nE. Who does \"she\" in \"the draft she sent me\" refer to?\n\nF. On what day of the week was that draft sent to Ryan?\n\nG. In Ryan's statement, does \"last Friday\" refer to the Friday immediately preceding the week in which Ryan was speaking, or to the Friday of that same week?\n\nH. Can it be determined from the passage whether Ryan actually contacted the older sister?\n\nOutput only the following JSON object:\n\n{\"A\":\"day\",\"B\":\"day\",\"C\":\"person\",\"D\":\"person\",\"E\":\"person\",\"F\":\"day\",\"G\":\"preceding Friday/same-week Friday\",\"H\":\"determinate/indeterminate\"}"
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-LIT-P04_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Read the following record carefully.\n\nOn Monday afternoon, it was discovered that a sample stored in a laboratory had been moved to a different shelf.\n\nAt 2:10 p.m., Sarah told the laboratory manager:\n\n\"Shortly after 1:00 p.m., I saw Thomas coming out of the storage room.\"\n\nThomas replied:\n\n\"I was not in the storage room at any time after noon today.\"\n\nThe access-control system recorded the use of Thomas's access card at 1:07 p.m. However, the system records the use of a card, not the identity of the person who uses it.\n\nLater that afternoon, security footage from the hallway showed a person wearing the gray jacket Thomas normally wears walking near the storage room at approximately 1:08 p.m. The person's face was not visible.\n\nThe following day, Daniel stated:\n\n\"I had borrowed Thomas's gray jacket from around noon until about 2:00 p.m. yesterday.\"\n\nThomas also said:\n\n\"There was a period during lunch when I left my card case on my desk while I was away.\"\n\nSarah later clarified her original statement:\n\n\"I didn't actually see the person's face. I assumed it was Thomas because of the jacket.\"\n\nThere is no video showing anyone actually moving the sample, and the sample can only be established to have been moved sometime between 1:00 p.m. and 1:30 p.m.\n\nFor each statement below, classify it as T if it must be true from the record, F if it is contradicted by the record, or U if it cannot be determined from the record.\n\nA. Thomas's access card was used at 1:07 p.m.\n\nB. Thomas himself entered the storage room at 1:07 p.m.\n\nC. At approximately 1:08 p.m., a person wearing Thomas's gray jacket was near the storage room.\n\nD. The person shown in the footage at approximately 1:08 p.m. was Daniel.\n\nE. Sarah's original identification of the person as Thomas was based at least in part on the gray jacket.\n\nF. The access-control record alone proves that Thomas's statement that he was not in the storage room after noon was false.\n\nG. Daniel used Thomas's access card.\n\nH. Thomas moved the sample.\n\nI. Sarah's original identification and Thomas's statement cannot both be literally correct, but this alone does not establish that either person intentionally lied.\n\nOutput only the following JSON object:\n\n{\"A\":\"T/F/U\",\"B\":\"T/F/U\",\"C\":\"T/F/U\",\"D\":\"T/F/U\",\"E\":\"T/F/U\",\"F\":\"T/F/U\",\"G\":\"T/F/U\",\"H\":\"T/F/U\",\"I\":\"T/F/U\"}"
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-LIT-P05_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Translate the following passage into English. Output only the English translation.:\n\n進むべき道を決めるには、事前に入念に検討し、最も満足のいく選択をしたいものだ。ただ、その道が本当に当人に実りをもたらしてくれるかどうかを知るには、ある程度の時間をかけて実際に経験するほかない。ここに避けがたい試練がある。岐路に立った時、その選択の先には想像もつかない世界が待つに違いないと腹をくくることも時には必要だろう。"
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-LIT-P06_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Translate the following passage into natural Japanese while preserving its logical structure, scope of negation, tense, and counterfactual meaning. Output only the Japanese translation.:\n\nHad the reviewers merely said that the evidence did not establish that the treatment was ineffective, the editor would not have taken them to be recommending publication. What changed her view was not that any reviewer withdrew the methodological objection, but that two of those who had raised it conceded that, even if the secondary endpoint had been specified post hoc, this alone would not explain why the primary analysis—whose result none of them disputed—favored the treatment."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-LIT-P07_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Translate the entire passage below into natural and precise English.\n\nThe main explanatory text is written in Chinese and contains a quotation in Japanese. Translate both the Chinese commentary and the Japanese quotation into English, while preserving the fact that the Japanese passage is being quoted and subsequently analyzed by the Chinese writer.\n\nDo not add an interpretation that is stronger than what either the Chinese commentary or the quoted Japanese passage states. Output only the English translation.:\n\n下面这段说明所讨论的，并不是日文原句最终是否“主张维持现状”，而是该句究竟把自己的结论限制在怎样的证据基础之上。原文写道：\n\n「少なくとも、今回の結果だけを理由に設定を変更する必要があるとは言えない。もっとも、これは現在の設定が適切であることが確認されたという意味ではないし、今後別の証拠が得られた場合にも設定を変更すべきでないという意味でもない。」\n\n这里的「変更する必要があるとは言えない」所否定的，是根据“今回の結果だけ”推出“有必要修改设置”这一结论的充分根据，而不是反过来肯定“没有必要修改设置”这个更强的命题。换言之，原句既没有确认“维持现状”是正确行动，也没有把“修改设置”排除为可能行动。\n\n尤其不能把「今回の結果だけを理由に」处理成一个即使删去也不影响结论的附带成分。它限制的正是推论所允许采用的证据范围：句子所说的是，这一项结果本身不足以支持某个结论，而不是说无论还有什么其他证据，那个结论都不能成立。\n\n同样，后一句中的「という意味ではない」也不只是语气上的缓和。它明确阻止读者把前一句提升为两个更强的判断：其一，“现行设置已经得到证实是适当的”；其二，“即使以后出现新的证据，也不应修改设置”。\n\n即便事后真的发现现行设置是最合适的，也不能据此倒过来说原来的句子早已断言了这一点。命题后来碰巧为真，并不会提高先前话语本身的语义强度。反过来说，如果后来证明设置确实需要修改，也不能因此断定原句当时就是错误的；因为原句否定的是由特定证据到特定结论的推断资格，而不一定是否定结论本身。"
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > LP-LIT-P08_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Translate the following passage into natural Japanese while preserving its argumentative structure, the scope of its qualifications, and the distinction between what the critic asserts and what the critic deliberately leaves unresolved. Retain the quoted Classical Chinese lines exactly as they appear in the source text. Do not replace them with a Japanese kundoku reading. Translate the English discussion surrounding them into Japanese. Output only the Japanese translation.:\n\nThe critic invokes Du Fu's lines,\n\n「國破山河在，城春草木深。感時花濺淚，恨別鳥驚心。」\n\nnot as evidence that the persistence of the natural world somehow compensates for political devastation, but precisely to resist that consolation. On this reading, 「山河在」 is not equivalent to saying that the country, in any politically meaningful sense, endures: what remains is set against, and made painful by, the preceding 「國破」. Nor does the critic regard 「城春」 as undoing the destruction. The arrival of spring makes the ruined city more, not less, difficult to look at.\n\nThe next couplet is deliberately treated with greater caution. The critic notes that 「花濺淚」 can be read in more than one way and refuses to settle too quickly whether the flowers are poetically imagined as shedding tears, whether the sight of the flowers causes the speaker to weep, or whether the line is effective precisely because those possibilities are not cleanly separated. Her claim is therefore not that grammatical ambiguity is irrelevant, but that resolving it is not a prerequisite for understanding the emotional relation the couplet establishes between perceiver and perceived.\n\nHad the poem merely opposed a ruined human order to an untouched and therefore consoling natural order, the contrast would be comparatively simple. The critic's argument is that it does something more difficult: spring remains spring, the mountains and rivers remain, and yet none of this cancels the loss against which those continuities are perceived. This is not to say that the poem permits no consolation at all. It is only to say that consolation cannot be inferred from the persistence of nature alone."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON



