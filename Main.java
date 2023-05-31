    private static Duration calculateTotalProcessingTime(List<ProcessingInfo> processingInfos) {
        Duration totalDuration = Duration.ZERO;
        for (ProcessingInfo processingInfo : processingInfos) {
            totalDuration = totalDuration.plus(Duration.between(processingInfo.getStartTime(), processingInfo.getEndTime()));
        }
        return totalDuration;
    }
