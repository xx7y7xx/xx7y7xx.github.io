const findLineWithPoint = (lines, findPoint) => {
  return lines.find((line) => {
    // line = [[5,5],[4,4]] => '5,5,4,4'
    // findPoint = [5,5] => '5,5'
    return line.find((point) => {
      return point.toString() === findPoint.toString();
    });
  });
};

const findLineAnotherEnd = (line, oneEnd) => {
  // line = [[5,5],[4,4],[4.1,4.1]]
  // oneEnd = [5,5]
  // should return [4.1,4.1]
  const indexOfOneEnd = line.findIndex((point) => {
    return point.toString() === oneEnd.toString();
  });
  return indexOfOneEnd === 0 ? line[line.length - 1] : line[0];
};

const removeLineFromLines = (lines, line) => {
  return lines.filter((l) => {
    return l.toString() !== line.toString();
  });
};

/**
 * Connect multiple small lines into one big line.
 * Every small line is an array of points, e.g. [[1, 2], [3, 4]]
 * For example:
 * We input 4 lines, lines=[[[2,2],[3,3]],[[5,5],[4,4]],[[3,3],[4,4]],[[2,2],[1,1]]]
 * Use grapgh to represent:
 * ```
 * 2 -- 3
 * 5 -- 4
 * 3 -- 4
 * 2 -- 1
 * ```
 * After connect
 * ```
 * 5 -- 4 4 -- 3 3 -- 2 2 -- 1
 * ```
 * @param {Array<Line>} lines
 * @returns line
 */
function connectLines(lines) {
  // find two endpoints of the final big line
  const pointToLinesMap = {
    // point: [lineA, lineB] // this point exist in 2 lines
    // point: [lineA] // this point exists in only one line, so it should be one endpoint of the final big line
  };
  lines.forEach((line) => {
    const startPoint = line[0];
    const endPoint = line[line.length - 1];
    if (pointToLinesMap[startPoint]) {
      pointToLinesMap[startPoint].push(line);
    } else {
      pointToLinesMap[startPoint] = [line];
    }
    if (pointToLinesMap[endPoint]) {
      pointToLinesMap[endPoint].push(line);
    } else {
      pointToLinesMap[endPoint] = [line];
    }
  });
  const startEndPointsMap = [
    // '5,5': [[5,5],[4,4]]
    // '1,1': [[1,1],[2,2]]
  ];
  Object.keys(pointToLinesMap).forEach((point /*e.g. '5,5'*/) => {
    // for one end of the big line, the point should only exist in one small line.
    if (pointToLinesMap[point].length === 1) {
      startEndPointsMap[point] = pointToLinesMap[point][0];
    }
    // if the point exists in more than 2 small lines, for example 3 lines, this point must be an intersection point.
    // ```
    //    |
    //    .
    //   / \
    // ```
    if (pointToLinesMap[point].length > 2) {
      throw new Error(
        'Not implemented yet for the case that a point exists in more than 2 lines, this point must be an intersection point.'
      );
    }
  });

  // start from one end (random selected), search lines
  const randomEnd = Object.keys(startEndPointsMap)[0]; // e.g. '5,5'

  const retLines = [];

  // loop while linesPool is empty
  // start from randomEnd='5,5'
  let currentPoint = randomEnd.split(','); // e.g. [5,5]
  let linesPool = [...lines];
  do {
    // find line with currentPoint
    const currentLine = findLineWithPoint(linesPool, currentPoint);

    // line should connect from left to right
    // so if currentLine is [[4,4],[5,5]], we should reverse it to [[5,5],[4,4]]
    // and then if next line is [[3,3],[4,4]], we should reverse it to [[4,4],[3,3]], then merge into [[5,5],[4,4],[4,4],[3,3]]
    if (currentLine[0].toString() !== currentPoint.toString()) {
      currentLine.reverse();
    }

    retLines.push(currentLine);
    currentPoint = findLineAnotherEnd(currentLine, currentPoint);
    linesPool = removeLineFromLines(linesPool, currentLine);
  } while (linesPool.length > 0);

  // merge all the lines
  let bigLine = [];
  retLines.forEach((line) => {
    bigLine = bigLine.concat(line);
  });

  return bigLine;
}
