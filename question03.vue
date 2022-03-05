<template>
  <!-- 3. 검색어 자동 완성하기 -- (Vue)
  list 데이터를 이용해 키워드 입력시 키워드가 포함되는 데이터를 출력하고, 입력한 키워드와 매칭되는 글자를 굵게 표시하시오 (<strong></strong>) -->
  <div id="app">
    <input type="text" @keyup="recommendHandler" />
    <ul id="result" v-for="(item, index) in recommendList" :key="index">
      <li>
        {{ item.beforehand }}<strong>{{ keyword }}</strong
        >{{ item.afterhand }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      list: [
        "서버 개발자",
        "프론트엔드 개발자",
        "iOS 개발자",
        "안드로이드 개발자",
        "QA 테스트 엔지니어",
        "머신러닝 엔지니어",
        "데이터 엔지니어",
        "보안 엔지니어",
        "CTO",
        "임베디드 개발자",
        "시스템・네트워크 관리자",
        "시스템 설계",
        "DevOps",
        "DBA",
        "영상・음성 엔지니어",
        "그래픽스 엔지니어",
        "CIO",
      ],
      recommendList: [],
      keyword: "",
    };
  },

  methods: {
    recommendHandler(e) {
      const input = e.target.value;
      this.recommendList = [];
      if (!input) return;
      this.list.forEach((item) => {
        if (!item.includes(input)) return;
        this.recommendList.push({
          beforehand: item.slice(0, item.indexOf(input)),
          afterhand: item.slice(item.indexOf(input) + input.length),
        });
      });
      this.keyword = input;
    },
  },
};
</script>