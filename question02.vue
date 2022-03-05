<template>
  <!-- 2. 중간 광고 삽입하기 — (Vue)
    다음 v-for문 안에서 최초에 3번째 컨텐츠 다음에 광고를, 그 다음에는 5개 컨텐츠 마다 광고를 삽입하려고 합니다.
    데이터 갯수에 구애받지 않게 광고를 삽입하는 코드를 만들어주세요 -->
  <div id="app">
    <div v-for="(item, index) in list" :key="index">
      <div>{{ item }}</div>
      <div v-if="index === 2">{{ blurb }}</div>
      <div v-else-if="index > 3 && (index + 3) % 5 === 0">{{ blurb }}</div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      list: [
        "1번 컨텐츠",
        "2번 컨텐츠",
        "3번 컨텐츠",
        "4번 컨텐츠",
        "5번 컨텐츠",
        "6번 컨텐츠",
        "7번 컨텐츠",
        "8번 컨텐츠",
        "9번 컨텐츠",
        "10번 컨텐츠",
        "11번 컨텐츠",
        "12번 컨텐츠",
        "13번 컨텐츠",
      ],
      blurb: "광고",
    };
  },
};
</script>