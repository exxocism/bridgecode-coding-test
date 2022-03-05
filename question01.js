// 1.닉네임 중복 체크 -- (자바스크립트)
// 두 배열 source1과 source2를 조합해서 배열 nick 의 요소와 중복되지 않는 랜덤 닉네임을 출력하시오.
// ※ 사용한 닉네임은 nick에 넣어 재사용이 안되게 하고, 소스를 다 소진한 경우 ‘종료’로 출력할 것

// // 랜덤 닉네임 소스
// const source1 = ['감자', '양파', '대파', '피망', '대추']
// const source2 = ['고래', '기린', '비버', '참새', '비둘기']

// // 기존 유저 닉네임
// const nick = ['감자비버', '양파비둘기', '피망고래', '대추기린']

const randomNicknames = (source1, source2) => {
  const newNick = [];
  const nick = new Set(['감자비버', '양파비둘기', '피망고래', '대추기린']);

  for (let i = 0; i < source1.length; i++) {
    for (let j = 0; j < source2.length; j++) {
      const nickname = source1[i] + source2[j];
      if (!nick.has(nickname)) {
        nick.add(nickname);
        newNick.push(nickname);
      }
    }
  }

  newNick.push('종료');
  return newNick;
};

const source1 = ['감자', '양파', '대파', '피망', '대추'];
const source2 = ['고래', '기린', '비버', '참새', '비둘기'];
console.log(...randomNicknames(source1, source2));
