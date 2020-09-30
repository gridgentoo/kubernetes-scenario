Проект **Chaos Mesh** предлагает богатый выбор типов экспериментов. В настоящее время доступны следующие варианты:

| Category      | Type             | Experiment Description  |
|:-------------:|------------------|-------------------------|
| Pod Lifecycle | Pod Failure      | Killing pods. |
| Pod Lifecycle | Pod Kill         | Pods becoming unavailable. |
| Pod Lifecycle | Container Kill   | Killing containers in pods. |
| Network       | Partition        | Separate Pods into independent subnets by blocking communication between them. |
| Network       | Loss             | Inject network communication loss. |
| Network       | Delay            | Inject network communication latency. |
| Network       | Duplication      | Inject packet duplications. |
| Network       | Corrupt          | Inject network communication corruption. |
| Network       | Bandwidth        | Limit the network bandwidth. |
| I/O           | Delay            | Inject delay during I/O. |
| I/O           | Errno            | Inject error during I/O. |
| I/O           | Delay and Errno  | Inject both delays and errors wit I/O. |
| Linux Kernel  |                  | Inject kernel errors into pods. |
| Clock         | Offset           | Inject clock skew into pods. |
| Stress        | CPU              | Simulate pod CPU stress. |
| Stress        | Memory           | Simulate pod memory stress. |
| Stress        | CPU & Memory     | Simulate both CPU and memory stress on Pods. |


Вы также можете использовать этот сценарий в качестве песочницы для создания других экспериментов и изучения растущего списка функций **Chaos Mesh**. 
На следующих этапах мы проведем несколько экспериментов.
