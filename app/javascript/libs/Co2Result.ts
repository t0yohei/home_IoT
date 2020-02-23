interface ResultCo2Json{
    co2: string
    message: string
}

class Co2Result {
  co2: string;
  message: string;
  time: string;

  constructor(resultJson: ResultCo2Json) {
    this.co2 = resultJson.co2;
    this.message = resultJson.message;
    this.time = this.calcTimeNow();
  }

  public static build(resultJson: ResultCo2Json): Co2Result {
    return new Co2Result(resultJson)
  }

  private calcTimeNow(): string {
    const now = new Date();
    return now.toLocaleTimeString();
  }
}

export default Co2Result;