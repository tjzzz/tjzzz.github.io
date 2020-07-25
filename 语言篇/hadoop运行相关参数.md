# hadoop运行相关参数



在任务运行时候修改参数

|  任务   |   命令  |
| --- | --- |
| kill任务 | hadoop job -kill ${job-id} |
| 修改优先级 |job -set-priority ${job-id} ${priority}|
| 修改map并发 | hadoop job -set-map-capacity job-id n |
| 修改reduce并发 | hadoop job -set-reduce-capacity job-id n |
| 任务挂起 | hadoop job -suspend ${job-id} $hours |


