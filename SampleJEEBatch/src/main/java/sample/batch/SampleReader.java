package sample.batch;

import java.io.Serializable;

import javax.batch.api.chunk.ItemReader;
import javax.inject.Named;

@Named("sample.batch.SampleReader")
public class SampleReader implements ItemReader {
	private int readCount = 0;

	public SampleReader() {
		// TODO Auto-generated constructor stub
		System.out.println("[SampleReader] SampleReader()");
	}

	@Override
	public Serializable checkpointInfo() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("[SampleReader] checkpointInfo()");
		return null;
	}

	@Override
	public void close() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("[SampleReader] close()");

	}

	@Override
	public void open(Serializable arg0) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("[SampleReader] open()");

	}

	@Override
	public Object readItem() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("[SampleReader] readItem() readCount = " + readCount);
		if (readCount < 10) {
			String val = "readData#" + readCount;
			++readCount;
			return val;
		}

		return null;
	}

}
