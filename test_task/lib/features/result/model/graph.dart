import 'package:test_task/repository/point.dart';

int bigNumber = 1000;

class Graph {
 //не завершено
}

List<Point> convertGridToPoints(List<List<String>> grid) {
  List<Point> points = [];

  for (int x = 0; x < grid.length; x++) {
    for (int y = 0; y < grid[x].length; y++) {
      if (grid[x][y] == '.') {
        points.add(Point(x: x, y: y));
      }
    }
  }

  return points;
}

List<List<int>> buildAdjacencyMatrix(List<Point> points) {
  int n = points.length;
  List<List<int>> adjacencyMatrix =
      List.generate(n, (_) => List.generate(n, (_) => 0));

  for (int i = 0; i < n; i++) {
    Point p1 = points[i];
    for (int j = 0; j < n; j++) {
      if (i == j) continue; 

      Point p2 = points[j];
      if ((p1.x == p2.x &&
              (p1.y == p2.y - 1 ||
                  p1.y == p2.y + 1)) || 
          (p1.y == p2.y && (p1.x == p2.x - 1 || p1.x == p2.x + 1))) {
        adjacencyMatrix[i][j] = 1;
      }
    }
  }

  return adjacencyMatrix;
}

List<int> dijkstra(List<List<int>> adjacencyMatrix, int start, int end) {
  int n = adjacencyMatrix.length;
  List<int> distances = List.filled(n, bigNumber);
  List<bool> visited = List.filled(n, false);
  List<int> previous = List.filled(n, -1);

  distances[start] = 0;

  for (int i = 0; i < n - 1; i++) {
    int u = _minDistance(distances, visited);
    if (u == -1) break;
    visited[u] = true;

    for (int v = 0; v < n; v++) {
      if (!visited[v] &&
          adjacencyMatrix[u][v] != 0 &&
          distances[u] != bigNumber &&
          distances[u] + adjacencyMatrix[u][v] < distances[v]) {
        distances[v] = distances[u] + adjacencyMatrix[u][v];
        previous[v] = u;
      }
    }
  }

  return _constructPath(previous, start, end);
}

int _minDistance(List<int> distances, List<bool> visited) {
  int min = bigNumber;
  int minIndex = -1;

  for (int i = 0; i < distances.length; i++) {
    if (!visited[i] && distances[i] <= min) {
      min = distances[i];
      minIndex = i;
    }
  }

  return minIndex;
}

List<int> _constructPath(List<int> previous, int start, int end) {
  List<int> path = [];
  for (int at = end; at != -1; at = previous[at]) {
    path.add(at);
  }
  path = path.reversed.toList();

  if (path.isNotEmpty && path[0] == start) {
    return path;
  } else {
    return [];
  }
}

String formatPath(List<Point> points, List<int> path) {
  return path
      .map((index) => '(${points[index].y};${points[index].x})')
      .join('->');
}


String getResults(List<List<String>> grid, Point start, Point end) {
   List<List<String>> grid = [
    ['.', 'X', '.'],
    ['.', 'X', '.'],
    ['.', '.', '.']
  ];

  List<Point> points = convertGridToPoints(grid);
  List<List<int>> adjacencyMatrix = buildAdjacencyMatrix(points);
  int start = 0; 
  int end = points.length - 4;
  List<int> shortestPathIndices = dijkstra(adjacencyMatrix, start, end);
  String formattedPath = formatPath(points, shortestPathIndices);
  
  return formattedPath;
}
