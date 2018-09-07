package sample.batch;

import java.io.Serializable;
import java.util.List;

import javax.batch.api.chunk.ItemWriter;
import javax.inject.Named;

@Named("sample.batch.SampleWriter")
public class SampleWriter implements ItemWriter {

	public SampleWriter() {
		// TODO Auto-generated constructor stub
		System.out.println("[SampleWriter] SampleWriter()");
	}

	@Override
	public Serializable checkpointInfo() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("[SampleWriter] checkpointInfo()");
		return null;
	}

	@Override
	public void close() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("[SampleWriter] close()");
	}

	@Override
	public void open(Serializable arg0) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("[SampleWriter] open()");
	}

	@Override
	public void writeItems(List<Object> arg0) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("[SampleWriter] writeItems()");
	}

}
